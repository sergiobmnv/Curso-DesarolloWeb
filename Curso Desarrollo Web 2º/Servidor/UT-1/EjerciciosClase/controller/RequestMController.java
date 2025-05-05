package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class RequestMController {
	
	@GetMapping(value = "/mensaje")
	public String indexMensaje(Model modelo) {
		modelo.addAttribute("mensaje", "Estamos probando un mensaje desde info/mensaje");
		return "mensaje";
	}
	
	@GetMapping(value = "/mensajeCompleto")
	public String indexMensajeCompleto(Model modelo) {
		modelo.addAttribute("mensaje", "Estamos probando un mensaje desde info/mensajeCompleto");
		return "mensajeCompleto";
	}

}
