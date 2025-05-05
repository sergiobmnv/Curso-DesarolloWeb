package com.desarrolloservidor.practicaBiblioteca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import com.desarrolloservidor.practicaBiblioteca.servicio.LibroService;

@Controller
public class LibroController {
	
	@Autowired
	private LibroService libroService;
    
    // Listar libros
    @GetMapping(value = "/libros")
    public String listarLibros(Model model) {
        model.addAttribute("libros", libroService.obtenerTodosLosLibros());
        return "libros/mostrarLibros";
    }
    
    // Mostrar formulario para crear nuevo libro
    @GetMapping("/nuevoLibro")
    public String mostrarFormularioCrear(Model model) {
        model.addAttribute("libroSergio", new LibroDTO());
        return "libros/crear_libro";
    }

    // Procesar nuevo libro
    @PostMapping("/guardar_libro")
    public String crearLibro(@ModelAttribute LibroDTO libro) {
        libroService.crearLibro(libro);
        return "redirect:/libros";
    }

}
