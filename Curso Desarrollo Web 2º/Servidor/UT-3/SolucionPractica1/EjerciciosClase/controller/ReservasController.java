package com.desarrolloservidor.practicaBiblioteca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.desarrolloservidor.practicaBiblioteca.model.LibroConCantidad;
import com.desarrolloservidor.practicaBiblioteca.model.LibroDTO;
import com.desarrolloservidor.practicaBiblioteca.model.ReservaDTO;
import com.desarrolloservidor.practicaBiblioteca.model.UsuarioDTO;
import com.desarrolloservidor.practicaBiblioteca.servicio.LibroService;
import com.desarrolloservidor.practicaBiblioteca.servicio.ReservasService;
import com.desarrolloservidor.practicaBiblioteca.servicio.UsuarioService;

@Controller
public class ReservasController {
	
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private LibroService libroService;
	@Autowired
	private ReservasService reservasService;
	
	// Método para mostrar el formulario de reserva de libros
    @GetMapping("/reservas")
    public String mostrarFormularioReserva(Model model) {
        return "reservas/reservar_libro";
    }

    // Método para reservar un libro
    @PostMapping("/reservas/realizar")
    public String reservarLibro(@RequestParam("dniUsuario") String dniUsuario,
                                @RequestParam("isbnLibro") String isbnLibro,
                                Model model) {

        UsuarioDTO usuario = null;
        LibroConCantidad libroCantidad = null;
        
        usuario = usuarioService.obtenerUsuario(dniUsuario);

        if (usuario == null) {
            model.addAttribute("error", "Usuario no encontrado.");
            return "reservas/reservar_libro";
        }else {
            if (usuario.getEdad() < 18) {
                model.addAttribute("error", "El usuario debe ser mayor de 18 años para reservar un libro.");
                return "reservas/reservar_libro";
            }else {
                libroCantidad = libroService.obtenerLibroCantidad(isbnLibro);

                if (libroCantidad == null) {
                    model.addAttribute("error", "Libro no encontrado.");
                    return "reservas/reservar_libro";
                }else {
                	libroService.actualizarEstadoLibro(libroCantidad, isbnLibro, "reservado");
                	reservasService.actualizarReserva(usuario.getDni(), usuario.getNombre(), isbnLibro, libroCantidad.getLibro().getTitulo());
                	model.addAttribute("mensaje", "Libro reservado con éxito.");
                    return "reservas/reservar_libro";
                }
             }      
         }
    }
    
    // Historial reservas
    @GetMapping(value = "/historialReservas")
    public String listarLibros(Model model) {
        model.addAttribute("reservas", reservasService.obtenerTodasReservas());
        return "reservas/historial_reservas";
    }
    
    // Mostrar formulario para devolver libro
    @GetMapping("/forumlarioDevolucion")
    public String mostrarFormularioDevolucion() {
        return "reservas/introducirDNIeISBN";
    }
    
    // Método para devolver el libro
    @PostMapping("/devolverLibro")
    public String devolverLibro(@RequestParam("dniUsuario") String dniUsuario,
                                @RequestParam("isbnLibro") String isbnLibro,
                                Model model) {
    	
    	boolean encontrado = reservasService.buscarReserva(dniUsuario, isbnLibro);
    	
    	if(encontrado) {
    		LibroConCantidad libroCantidad = libroService.obtenerLibroCantidad(isbnLibro);
    		libroService.actualizarEstadoLibro(libroCantidad, isbnLibro, "disponible");
    		return "redirect:/";
	
    	}else {
    		return "reservas/reservaNoEncontrada";
    	}

    }

}
