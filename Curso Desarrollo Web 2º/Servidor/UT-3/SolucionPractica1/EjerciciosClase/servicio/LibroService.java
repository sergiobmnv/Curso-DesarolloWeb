package com.desarrolloservidor.practicaBiblioteca.servicio;

import com.desarrolloservidor.practicaBiblioteca.model.LibroConCantidad;
import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import java.util.List;

public interface LibroService {
    List<LibroDTO> obtenerTodosLosLibros();
    LibroDTO obtenerLibro(String isbn);
    void crearLibro(LibroDTO libro);
    void eliminarLibroPorISBN(String isbn);
    List<LibroDTO> obtenerLibrosModificar(String isbn);
    void modificarLibro(String isbn, List<String> nuevosTitulos, List<String> nuevosAutores, List<String> nuevosPublicadoEn);
    boolean buscarBorrarISBN(String isbn);
    List<LibroConCantidad> obtenerTodosLosLibrosEjemplar();
    LibroConCantidad obtenerLibroCantidad(String isbn);
    void incluirLibroConCantidad(LibroDTO libro);
    void actualizarEstadoLibro(LibroConCantidad libroCantidad, String isbn, String estado);
}
