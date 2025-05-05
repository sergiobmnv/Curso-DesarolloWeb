package com.desarrolloservidor.practicaBiblioteca.controller;

import com.desarrolloservidor.practicaBiblioteca.model.LibroConCantidad;
import com.desarrolloservidor.practicaBiblioteca.model.UsuarioDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ReservaController {

    UsuarioController usuarios = new UsuarioController();
    LibroController libros = new LibroController();

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
        boolean usuarioEncontrado = false;
        boolean libroEncontrado = false;
        String reservado = "NO";
        
        for (UsuarioDTO user : UsuarioController.getUsuarios()) {
            if (user.getDni().equals(dniUsuario)) {
                usuario = user;
                usuarioEncontrado = true;
            }
        }

        if (!usuarioEncontrado) {
            model.addAttribute("error", "Usuario no encontrado.");
            return "reservas/reservar_libro";
        }else {
        	// Verificar si el usuario tiene más de 18 años
            if (usuario.getEdad() < 18) {
                model.addAttribute("error", "El usuario debe ser mayor de 18 años para reservar un libro.");
                return "reservas/reservar_libro";
            }else {
            	 // Buscar el libro por ISBN en la lista de LibrosCantidad
                LibroConCantidad libroCantidad = null;
                for (LibroConCantidad lc : LibroController.getLibrosCantidad()) {
                    if (lc.getLibro().getISBN().equals(isbnLibro)) {
                        libroCantidad = lc;
                        libroEncontrado = true;
                    }
                }

                if (!libroEncontrado) {
                    model.addAttribute("error", "Libro no encontrado.");
                    return "reservas/reservar_libro";
                }else {
                        // Reducir la cantidad
                        libroCantidad.setCantidad(libroCantidad.getCantidad() - 1);

                        // Si la cantidad llega a 0, eliminar el libro de la lista de libros con cantidad
                        if (libroCantidad.getCantidad() == 0) {
                        	LibroController.getLibrosCantidad().remove(libroCantidad);
                        }

                        // Cambiar el estado del libro a "reservado" en la lista general de libros
                        for(int i=0; i<LibroController.getLibros().size() && reservado.equals("NO"); i++){
                        	if (LibroController.getLibros().get(i).getISBN().equals(isbnLibro) && LibroController.getLibros().get(i).getEstado().equals("disponible")) {
                        		LibroController.getLibros().get(i).setEstado("reservado");
                        		reservado = "SI";   
                            }
                        }

                        model.addAttribute("mensaje", "Libro reservado con éxito.");
      
                    return "reservas/reservar_libro";
                }
             }      
         }
    }
}
