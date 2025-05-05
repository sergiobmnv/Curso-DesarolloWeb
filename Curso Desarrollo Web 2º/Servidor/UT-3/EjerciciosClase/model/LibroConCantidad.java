package com.desarrolloservidor.practicaBiblioteca.model;

public class LibroConCantidad {
    private LibroDTO libro;
    private int cantidad;

    public LibroConCantidad(LibroDTO libro, int cantidad) {
        this.libro = libro;
        this.cantidad = cantidad;
    }

    public LibroDTO getLibro() {
        return libro;
    }

    public void setLibro(LibroDTO libro) {
        this.libro = libro;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}

