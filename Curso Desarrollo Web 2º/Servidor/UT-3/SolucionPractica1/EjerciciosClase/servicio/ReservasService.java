package com.desarrolloservidor.practicaBiblioteca.servicio;

import com.desarrolloservidor.practicaBiblioteca.model.LibroConCantidad;
import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import com.desarrolloservidor.practicaBiblioteca.model.ReservaDTO;

import java.util.List;

public interface ReservasService {
    List<ReservaDTO> obtenerTodasReservas();
    void actualizarReserva(String dniUsuario, String nombreUsuario, String isbn, String tituloLibro);
    boolean buscarReserva(String dni, String isbn);
}
