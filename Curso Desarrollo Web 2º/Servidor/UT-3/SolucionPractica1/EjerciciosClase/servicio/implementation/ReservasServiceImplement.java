package com.desarrolloservidor.practicaBiblioteca.servicio.implementation;

import com.desarrolloservidor.practicaBiblioteca.model.LibroConCantidad;
import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import com.desarrolloservidor.practicaBiblioteca.model.ReservaDTO;
import com.desarrolloservidor.practicaBiblioteca.servicio.LibroService;
import com.desarrolloservidor.practicaBiblioteca.servicio.ReservasService;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class ReservasServiceImplement implements ReservasService {

    private List<ReservaDTO> reservas = new ArrayList<>();

    @Override
    public List<ReservaDTO> obtenerTodasReservas(){
    	return reservas;
    }
    
    @Override
    public void actualizarReserva(String dniUsuario, String nombreUsuario, String isbn, String tituloLibro) {
    	reservas.add(new ReservaDTO(dniUsuario, nombreUsuario, isbn, tituloLibro));
    }
    
    @Override
    public boolean buscarReserva(String dni, String isbn) {
    	ReservaDTO reserva = null;
    	boolean encontrado = false;
    	
    	for(ReservaDTO r : reservas) {
    		if(r.getDniUsuario().equals(dni) && r.getIsbnLibro().equals(isbn) && r.getDevuelto().equals("NO")) {
    			reserva = r;
    			encontrado = true;
    		}
    	}
    	
    	if(encontrado) {
    		reserva.setDevuelto("SI");
    	}
    	
    	return encontrado;
    }
}
