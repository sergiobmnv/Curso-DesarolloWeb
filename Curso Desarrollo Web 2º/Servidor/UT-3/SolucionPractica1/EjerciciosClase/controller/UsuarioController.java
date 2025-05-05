package com.desarrolloservidor.practicaBiblioteca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.desarrolloservidor.practicaBiblioteca.model.UsuarioDTO;
import com.desarrolloservidor.practicaBiblioteca.servicio.UsuarioService;

@Controller
public class UsuarioController {
	
	@Autowired
	private UsuarioService usuarioService;
	
	// Método para mostrar todos los usuarios
    @GetMapping("/usuarios")
    public String mostrarTodosLosUsuarios(Model model) {
        model.addAttribute("usuarios", usuarioService.obtenerTodosLosUsuarios());
        return "usuarios/usuarios";
    }

    // Método para mostrar el formulario de creación de usuarios
    @GetMapping("/usuarios/crear")
    public String mostrarFormularioCrearUsuario(Model model) {
        model.addAttribute("nuevoUsuario", new UsuarioDTO());
        return "usuarios/crear_usuarios";
    }

    // Método para crear un nuevo usuario
    @PostMapping("/usuarios/crear")
    public String crearUsuario(@ModelAttribute UsuarioDTO nuevoUsuario, Model model) {
        boolean encontrado = false;
    	encontrado = usuarioService.crearUsuario(nuevoUsuario);
        
        if (encontrado) {
            model.addAttribute("error", "El usuario con el DNI " + nuevoUsuario.getDni() + " ya existe.");
            return "usuarios/usuarioRepetidos";
        }else {
            return "redirect:/usuarios";
        }

    }

}
