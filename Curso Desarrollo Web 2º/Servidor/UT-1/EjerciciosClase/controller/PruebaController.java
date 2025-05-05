package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PruebaController {
	
	@GetMapping(value = {"/prueba", "localizacion"})
	public String metodoPrueba(Model modelo) {
		modelo.addAttribute("nombre", "Biblioteca de Manzanares");
		modelo.addAttribute("localizacion", "Calle Carcel, numero 80");
		return "infoBiblioteca";
	}
	
}
