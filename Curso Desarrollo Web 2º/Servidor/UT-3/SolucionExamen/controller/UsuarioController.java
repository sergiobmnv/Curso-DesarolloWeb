package com.desarrolloservidor.practicaBiblioteca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

import com.desarrolloservidor.practicaBiblioteca.model.UsuarioDTO;

@Controller
public class UsuarioController {

    // Lista de usuarios
    public static List<UsuarioDTO> usuarios = new ArrayList<>();

	public static List<UsuarioDTO> getUsuarios() {
		return usuarios;
	}

	public static void setUsuarios(List<UsuarioDTO> usuarios) {
		UsuarioController.usuarios = usuarios;
	}

    // Método para mostrar todos los usuarios
    @GetMapping("/usuarios")
    public String mostrarTodosLosUsuarios(Model model) {
        model.addAttribute("usuarios", usuarios);
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
    	// Verificar si el usuario con el mismo DNI ya existe
        for (UsuarioDTO usuario : usuarios) {
            if (usuario.getDni().equals(nuevoUsuario.getDni())) {
            	encontrado = true;
            }
        }
        
        if (encontrado) {
            model.addAttribute("error", "El usuario con el DNI " + nuevoUsuario.getDni() + " ya existe.");
            return "usuarios/usuarioRepetidos"; // Redirigir al formulario de creación con error
        }else {
            // Añadir el usuario si no existe previamente
            usuarios.add(nuevoUsuario);
            return "redirect:/usuarios"; // Redirigir a la lista de usuarios
        }

    }
    
}

