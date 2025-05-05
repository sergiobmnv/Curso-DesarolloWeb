package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.modelo.LibroDTO;

import org.springframework.ui.Model;

@Controller
public class PostMController {

    private List<LibroDTO> listaLibros = new ArrayList<>();
    
    @GetMapping("/lista_libros")
    public String listarLibros(Model model) {
        model.addAttribute("libros", listaLibros);
        return "mostrarNuevoLibro";
    }

    // Mostrar el formulario para agregar un nuevo libro
    @GetMapping("/nuevo_libro")
    public String mostrarFormulario(Model model) {
        model.addAttribute("libro", new LibroDTO());
        return "nuevo_libro";
    }

    // Manejar la solicitud POST para guardar el libro
    @PostMapping("/guardar_libro")
    public String guardarLibro(@ModelAttribute LibroDTO libro, Model model) {
    	listaLibros.add(libro);
        model.addAttribute("libros", listaLibros);
        return "mostrarNuevoLibro";
    }
}

