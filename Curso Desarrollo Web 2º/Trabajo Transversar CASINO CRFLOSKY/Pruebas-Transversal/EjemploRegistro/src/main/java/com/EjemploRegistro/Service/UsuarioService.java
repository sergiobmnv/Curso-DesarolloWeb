package com.EjemploRegistro.Service;

import java.util.Optional;

import org.springframework.web.bind.annotation.PathVariable;

import com.EjemploRegistro.Entity.UsuarioEntity;
import com.EjemploRegistro.Model.UsuarioDTO;

public interface UsuarioService {
	UsuarioEntity registrarUsuario(UsuarioDTO usuarioDTO);
	UsuarioEntity encontrarPorID(String username);
	UsuarioDTO validarUsuario(UsuarioEntity usuario,String pwd);
}
