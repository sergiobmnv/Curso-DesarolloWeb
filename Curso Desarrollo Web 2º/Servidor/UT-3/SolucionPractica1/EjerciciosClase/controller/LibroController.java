package com.desarrolloservidor.practicaBiblioteca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import com.desarrolloservidor.practicaBiblioteca.servicio.LibroService;

@Controller
public class LibroController {
	
	@Autowired
	private LibroService libroService;
    
    // Listar libros
    @GetMapping(value = "/libros")
    public String listarLibros(Model model) {
        model.addAttribute("libros", libroService.obtenerTodosLosLibros());
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
        libroService.crearLibro(libro);
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
    	    	
    	model.addAttribute("librosVar", libroService.obtenerLibrosModificar(isbn));
    	model.addAttribute("isbnVar", isbn);
    	return "libros/editar_libro";

    }
    
    // Procesar edición de libro
    @PostMapping("/editarLibro")
    public String actualizarLibro(@RequestParam("isbn") String isbn, @RequestParam("nuevosTitulos") List<String> nuevosTitulos, @RequestParam("nuevosAutores") List<String> nuevosAutores, @RequestParam("nuevosPublicadoEn") List<String> nuevosPublicadoEn) {
	   libroService.modificarLibro(isbn, nuevosTitulos, nuevosAutores, nuevosPublicadoEn);
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
 	   	encontrado = libroService.buscarBorrarISBN(isbn);
  	
 	   	if(encontrado) {
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
        model.addAttribute("librosConCantidad", libroService.obtenerTodosLosLibrosEjemplar());
        return "libros/librosEjemplares";
    }

}
