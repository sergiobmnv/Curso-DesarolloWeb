package com.desarrolloservidor.practicaTiendaBBDD.service;

import java.util.List;

import com.desarrolloservidor.practicaTiendaBBDD.entity.Fabricante;

public interface FabricanteService {

    List<Fabricante> obtenerTodosFabricantes();

    Fabricante obtenerFabricanteId(Long id);

    List<Fabricante> buscarPorNombre(String nombre);

    Fabricante guardarFabricante(Fabricante fabricante);

    void eliminar(Long id);

    Fabricante actualizar(Fabricante fabricante);
}

