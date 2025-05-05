package com.EjemploRegistro.Controller;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.EjemploRegistro.Entity.UsuarioEntity;
import com.EjemploRegistro.Model.UsuarioDTO;
import com.EjemploRegistro.Repo.UsuarioRepository;
import com.EjemploRegistro.Service.UsuarioService;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioService usuarioService;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@PostMapping("/registrar")
	public String registrarUsuario(@RequestBody UsuarioDTO usuario) {
		
		System.out.println(usuario.getUsername());
		usuarioService.registrarUsuario(usuario);

	
		return "USUARIO REGISTRADO CORRECTAMENTE";
	}
	
	@GetMapping("/{username}/{pwd}")
	public String iniciarSesion(@PathVariable ("username") String username, 
			@PathVariable ("pwd") String pwd) {
		UsuarioEntity usuario = usuarioService.encontrarPorID(username);
		UsuarioDTO usuarioDTO = new UsuarioDTO();
		String respuesta;
		if(usuario==null) {
			respuesta = "404";
		}else {
			 usuarioDTO = usuarioService.validarUsuario(usuario, pwd);
			 if(usuarioDTO == null) {
				 respuesta = "Contraseña incorrecta";
			 }else {
				 respuesta = "OK";
			 }
		}
		return respuesta;
	}
	
}
