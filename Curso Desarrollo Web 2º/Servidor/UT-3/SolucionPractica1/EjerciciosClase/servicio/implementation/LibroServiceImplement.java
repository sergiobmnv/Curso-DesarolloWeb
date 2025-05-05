package com.desarrolloservidor.practicaBiblioteca.servicio.implementation;

import com.desarrolloservidor.practicaBiblioteca.model.LibroConCantidad;
import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import com.desarrolloservidor.practicaBiblioteca.servicio.LibroService;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class LibroServiceImplement implements LibroService {

    private List<LibroDTO> libros = new ArrayList<>();
    private List<LibroConCantidad> librosConCantidad = new ArrayList<>();
    long idCounter = 1L;

    @Override
    public LibroDTO obtenerLibro(String isbn) {
    	LibroDTO libro = null;
    	for(LibroDTO l : libros) {
    		if(l.getISBN().equals(isbn)) {
    			libro = l;
    		}
    	}
    	
    	return libro;
    }
    @Override
    public List<LibroDTO> obtenerTodosLosLibros() {
        return libros;
    }

    @Override
    public void crearLibro(LibroDTO libro) {
    	boolean encontrado = false;
    	
    	libro.setIdLibro(idCounter++);
        libros.add(libro);
        
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
    }

    @Override
    public void eliminarLibroPorISBN(String isbn) {
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
	   	}
	}
    
    @Override
    public List<LibroDTO> obtenerLibrosModificar(String isbn){
    	List<LibroDTO> librosModificar = new ArrayList<>();
    	
    	for(LibroDTO libro : libros) {
        	if (libro.getISBN().equals(isbn)) {
        		librosModificar.add(libro);
        	}
        }
    	return librosModificar;
    }
    
    @Override
    public void modificarLibro(String isbn, List<String> nuevosTitulos, List<String> nuevosAutores, List<String> nuevosPublicadoEn) {
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
	    }
    }
    
    @Override
    public boolean buscarBorrarISBN(String isbn) {
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
 	   	}
 	   	
 	   	return encontrado;
    }
    
    @Override
    public void incluirLibroConCantidad(LibroDTO libro) {
    	librosConCantidad.add(new LibroConCantidad(libro, 1));
    }
    
    @Override
    public List<LibroConCantidad> obtenerTodosLosLibrosEjemplar() {
        return librosConCantidad;
    }
    
    @Override
    public LibroConCantidad obtenerLibroCantidad(String isbn) {
    	LibroConCantidad libroCantidad = null;
        for (LibroConCantidad lc : librosConCantidad) {
            if (lc.getLibro().getISBN().equals(isbn)) {
                libroCantidad = lc;
            }
        }
        return libroCantidad;
    }
    
    @Override
    public void actualizarEstadoLibro(LibroConCantidad libroCantidad, String isbn, String estado) {
    	boolean reserva = true;
    	
    	if(estado.equals("reservado")) {
    		
	    	// Reducir la cantidad
	        libroCantidad.setCantidad(libroCantidad.getCantidad() - 1);
	
	        // Si la cantidad llega a 0, eliminar el libro de la lista de libros con cantidad
	        if (libroCantidad.getCantidad() == 0) {
	        	librosConCantidad.remove(libroCantidad);
	        }
	
	        // Cambiar el estado del libro a "reservado" en la lista general de libros
	        for(int i=0; i<libros.size() && reserva; i++){
	        	LibroDTO libro = libros.get(i);
	        	if (libro.getISBN().equals(isbn) && libro.getEstado().equals("disponible")) {
	        		libro.setEstado(estado);
	        		reserva = false;   
	            }
	        }
        }else {
        	
        	if(libroCantidad == null) {
        		LibroDTO libro = null;
            	for(LibroDTO l : libros) {
            		if(l.getISBN().equals(isbn)) {
            			libro = l;
            		}
            	}
            	
            	librosConCantidad.add(new LibroConCantidad(libro, 1));
        	}else {
        		libroCantidad.setCantidad(libroCantidad.getCantidad() + 1);
        	}

        	for(int i=0; i<libros.size() && reserva; i++){
	        	LibroDTO libro = libros.get(i);
	        	if (libro.getISBN().equals(isbn) && libro.getEstado().equals("reservado")) {
	        		libro.setEstado(estado);
	        		reserva = false;   
	            }
	        }
        	
        }
    }
    
}
