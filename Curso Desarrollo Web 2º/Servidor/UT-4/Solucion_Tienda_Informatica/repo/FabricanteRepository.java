package com.desarrolloservidor.practicaTiendaBBDD.repo;

import com.desarrolloservidor.practicaTiendaBBDD.entity.Fabricante;

import java.util.List;

//import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface FabricanteRepository extends JpaRepository<Fabricante, Long> {
    // JpaRepository ya incluye métodos para CRUD:
    // save() - Crear/Actualizar
    // findById() - Leer por ID
    // findAll() - Leer todos
    // deleteById() - Eliminar por ID
	
	// Consulta JPQL con parámetro nombrado
    @Query("SELECT f FROM Fabricante f WHERE f.nombre = :nombre")
    List<Fabricante> buscarPorNombre(@Param("nombre") String nombre);

}
