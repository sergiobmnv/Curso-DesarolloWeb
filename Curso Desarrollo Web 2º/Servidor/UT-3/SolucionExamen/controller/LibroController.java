package com.desarrolloservidor.practicaBiblioteca.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.desarrolloservidor.practicaBiblioteca.model.LibroConCantidad;
import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;

@Controller
public class LibroController {
	
	public static List<LibroDTO> libros = new ArrayList<>();
    private int idCounter = 1;
    
    public static List<LibroConCantidad> librosConCantidad = new ArrayList<>();
    
    public static List<LibroDTO> getLibros() {
		return libros;
	}

	public static void setLibros(List<LibroDTO> libros) {
		LibroController.libros = libros;
	}
	
	public static List<LibroConCantidad> getLibrosCantidad() {
		return librosConCantidad;
	}

	public static void setLibrosCantidad(ArrayList<LibroConCantidad> librosConCantidad) {
		LibroController.librosConCantidad = librosConCantidad;
	}

    // Listar libros
    @GetMapping(value = "/libros")
    public String listarLibros(Model model) {
        model.addAttribute("libros", libros);
        return "libros/mostrarLibros";
    }
    
    // Mostrar formulario para crear nuevo libro
    @GetMapping("/nuevoLibro")
    public String mostrarFormularioCrear(Model model) {
        model.addAttribute("libroSergio", new LibroDTO());
        return "libros/crear_libro";
    }

    // Procesar nuevo libro
    @PostMapping("/guardar_libro")
    public String crearLibro(@ModelAttribute LibroDTO libro) {
        libro.setIdLibro(idCounter++);
        libros.add(libro);
        
        boolean encontrado = false;

        // Buscar si el libro ya está en la lista por ISBN
        for (LibroConCantidad libroConCantidad : librosConCantidad) {
            if (libroConCantidad.getLibro().getISBN().equals(libro.getISBN())) {
                // Si ya esta, incrementamos la cantidad
                libroConCantidad.setCantidad(libroConCantidad.getCantidad() + 1);
                encontrado = true;
            }
        }

        // Si no está, lo añadimos con cantidad 1
        if (!encontrado) {
            librosConCantidad.add(new LibroConCantidad(libro, 1));
        }
        return "redirect:/libros";
    }
    
    // Mostrar formulario intrdoucir el isbn
    @GetMapping("/ingresarISBNeditar")
    public String mostrarFormularioIngresoIsbn() {
        return "libros/introducirISBN";
    }
    
    // Mostrar formulario para editar libro
    @GetMapping("/editarLibroISBN")
    public String mostrarFormularioEditar(@RequestParam("isbn") String isbn, Model model) {       
    	List<LibroDTO> librosModificar = new ArrayList<>();
    	
    	for(LibroDTO libro : libros) {
        	if (libro.getISBN().equals(isbn)) {
        		librosModificar.add(libro);
        	}
        }
    	
    	model.addAttribute("librosVar", librosModificar);
    	model.addAttribute("isbnVar", isbn);
    	return "libros/editar_libro";

    }

    // Procesar edición de libro
   @PostMapping("/editarLibro")
    public String actualizarLibro(@RequestParam("isbn") String isbn, @RequestParam("nuevosTitulos") List<String> nuevosTitulos, @RequestParam("nuevosAutores") List<String> nuevosAutores, @RequestParam("nuevosPublicadoEn") List<String> nuevosPublicadoEn, @RequestParam("estado") String estado) {
	   List<LibroDTO> librosModificar = new ArrayList<>();
   	
	   	for(LibroDTO libro : libros) {
	       	if (libro.getISBN().equals(isbn)) {
	       		librosModificar.add(libro);
	       	}
	    }
	   	
	   	for (int i = 0; i < librosModificar.size(); i++) {
	        LibroDTO libro = librosModificar.get(i);
	        libro.setTitulo(nuevosTitulos.get(i));
	        libro.setAutor(nuevosAutores.get(i));
	        libro.setPublicadoEn(nuevosPublicadoEn.get(i));
	        libro.setEstado(estado);
	    }
        return "redirect:/libros";
    }
   
   // Mostrar formulario intrdoucir el isbn
   @GetMapping("/ingresarISBEliminar")
   public String mostrarFormularioEliminar() {
       return "libros/introducirEliminarISBN";
   }
   
   @GetMapping("/eliminarLibroISBN")
   public String eliminarLibro(@RequestParam("isbn") String isbn, Model model) {    
	   	boolean encontrado = false;
	   	Iterator<LibroDTO> iterador = libros.iterator();
	   	Iterator<LibroConCantidad> iteradorCantidad = librosConCantidad.iterator();
	   	
	   	while (iterador.hasNext()) {
	        LibroDTO libro = iterador.next();
	        if (libro.getISBN().equals(isbn)) {
	            iterador.remove();
	            encontrado = true;
	        }
	    }
	   	   	
	   	if(encontrado) {
	   		while (iteradorCantidad.hasNext()) {
		   		LibroConCantidad libroConCantidad = iteradorCantidad.next();
		        if (libroConCantidad.getLibro().getISBN().equals(isbn)) {
		        	iteradorCantidad.remove();
		        }
		    }
	   		return "redirect:/libros";
	   	}
	   	else {
	   		model.addAttribute("isbnVar", isbn);
	   		return "libros/noEncontrados";
	   	}

   }
   
   // Método para mostrar la cantidad de libros
   @GetMapping("/librosEjemplares")
   public String mostrarCantidadLibros(Model model) {
       model.addAttribute("librosConCantidad", librosConCantidad);
       return "libros/librosEjemplares";
   }

}
