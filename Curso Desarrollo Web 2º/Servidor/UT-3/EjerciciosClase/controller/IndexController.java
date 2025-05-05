package com.desarrolloservidor.practicaBiblioteca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	@GetMapping(value = "/")
	public String paginaPrincipal() {
        return "index";
    }

}
