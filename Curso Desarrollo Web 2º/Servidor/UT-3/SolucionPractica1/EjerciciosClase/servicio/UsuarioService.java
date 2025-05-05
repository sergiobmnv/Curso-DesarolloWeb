package com.desarrolloservidor.practicaBiblioteca.servicio;

import com.desarrolloservidor.practicaBiblioteca.model.UsuarioDTO;
import java.util.List;

public interface UsuarioService {
	UsuarioDTO obtenerUsuario(String dni);
    List<UsuarioDTO> obtenerTodosLosUsuarios();
    boolean crearUsuario(UsuarioDTO nuevoUsuario);
}
