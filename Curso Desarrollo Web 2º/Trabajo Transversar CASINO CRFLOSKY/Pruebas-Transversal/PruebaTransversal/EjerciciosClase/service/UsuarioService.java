package com.desarrolloservidor.pruebaTransversal.service;

import com.desarrolloservidor.pruebaTransversal.entity.UsuarioEntity;
import com.desarrolloservidor.pruebaTransversal.model.UsuarioDTO;

public interface UsuarioService {

	UsuarioEntity registrarUsuario(UsuarioDTO usuarioDTO);
}
