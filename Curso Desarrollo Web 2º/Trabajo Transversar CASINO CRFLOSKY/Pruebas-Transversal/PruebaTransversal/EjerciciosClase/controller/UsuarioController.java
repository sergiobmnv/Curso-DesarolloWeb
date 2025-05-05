package com.desarrolloservidor.pruebaTransversal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.desarrolloservidor.pruebaTransversal.model.UsuarioDTO;
import com.desarrolloservidor.pruebaTransversal.service.UsuarioService;

@RestController
@RequestMapping("usuarios")
public class UsuarioController {
	
	@Autowired
	private UsuarioService usuarioService;
	
	@PostMapping("/registrar")
    public String registroUsuario(@RequestBody UsuarioDTO usuario) {
        usuarioService.registrarUsuario(usuario);
		
        return "Registro recibido para el usuario: ";
    }

}
