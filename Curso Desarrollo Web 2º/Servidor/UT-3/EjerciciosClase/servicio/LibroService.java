package com.desarrolloservidor.practicaBiblioteca.servicio;

import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import java.util.List;

public interface LibroService {
    List<LibroDTO> obtenerTodosLosLibros();
    void crearLibro(LibroDTO libro);
    void eliminarLibroPorISBN(String isbn);
}
