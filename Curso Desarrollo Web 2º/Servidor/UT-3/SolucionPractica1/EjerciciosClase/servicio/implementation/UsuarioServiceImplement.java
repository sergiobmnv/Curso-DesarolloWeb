package com.desarrolloservidor.practicaBiblioteca.servicio.implementation;

import com.desarrolloservidor.practicaBiblioteca.model.UsuarioDTO;
import com.desarrolloservidor.practicaBiblioteca.servicio.UsuarioService;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class UsuarioServiceImplement implements UsuarioService {

    private List<UsuarioDTO> usuarios = new ArrayList<>();
    
    @Override
    public List<UsuarioDTO> obtenerTodosLosUsuarios(){
    	return usuarios;
    }
    
    @Override
    public boolean crearUsuario(UsuarioDTO nuevoUsuario) {
    	boolean encontrado = false;
    	// Verificar si el usuario con el mismo DNI ya existe
        for (UsuarioDTO usuario : usuarios) {
            if (usuario.getDni().equals(nuevoUsuario.getDni())) {
            	encontrado = true;
            }
        }
        
        if (!encontrado) {
        	usuarios.add(nuevoUsuario);
        }
        
        return encontrado;
    }
    
    @Override
    public UsuarioDTO obtenerUsuario(String dni) {
    	UsuarioDTO usuario = null;
    	for (UsuarioDTO user : usuarios) {
            if (user.getDni().equals(dni)) {
                usuario = user;
            }
        }
    	return usuario;
    }
}
