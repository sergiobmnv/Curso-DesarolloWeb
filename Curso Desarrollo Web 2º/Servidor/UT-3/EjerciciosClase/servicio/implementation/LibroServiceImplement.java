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
}
