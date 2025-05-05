package com.example.demo.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.modelo.LibroDTO;

@Controller
public class IndexController {
	
	@GetMapping(value = "/")
	@ResponseBody
	public String hola() {
		return "Hola Mundo";
	}
	
	@GetMapping(value = {"/despedida", "/fin"})
	@ResponseBody
	public String adios() {
		return "Hasta luego";
	}
	
	/*@GetMapping(value = "/")
	public String index() {
		return "index";
	}*/
	
	@GetMapping(value = "/mensaje")
	public String indexMensaje(Model modelo) {
		modelo.addAttribute("mensaje", "Estamos probando un mensaje desde la /mensaje");
		modelo.addAttribute("mensajeCompleto", "Estamos probando un mensaje desde /mensajeCompleto");
		return "mensaje";
	}
	
	@GetMapping(value = "/mensajeCompleto")
	public String indexMensajeCompleto(Model modelo) {
		modelo.addAttribute("mensaje", "Estamos probando un mensaje desde /mensajeCompleto");
		return "mensajeCompleto";
	}
	
	@GetMapping("/biblioteca/libro")
	public String mostrarLibro(Model modelo) {
		LibroDTO libro = new LibroDTO("2024", "En agosto nos vemos", "Gabriel Garcia Marquez");
		modelo.addAttribute("titulo", "Ver libro");
		modelo.addAttribute("informacion", libro);
		return "mostrarLibro";
	}
	
	@GetMapping("/biblioteca/libroOrdenado")
	public String mostrarLibroOrdenado(Model modelo) {
		LibroDTO libro = new LibroDTO("2024", "En agosto nos vemos", "Gabriel Garcia Marquez");
		modelo.addAttribute("titulo", "Ver libro");
		modelo.addAttribute("informacion", libro);
		return "mostrarLibroOrdenado";
	}
	

}
