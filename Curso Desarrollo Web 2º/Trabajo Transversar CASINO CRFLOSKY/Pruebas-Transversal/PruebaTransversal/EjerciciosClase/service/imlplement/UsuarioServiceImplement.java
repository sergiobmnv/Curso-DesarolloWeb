package com.desarrolloservidor.pruebaTransversal.service.imlplement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.desarrolloservidor.pruebaTransversal.entity.UsuarioEntity;
import com.desarrolloservidor.pruebaTransversal.model.UsuarioDTO;
import com.desarrolloservidor.pruebaTransversal.repository.UsuarioRepository;
import com.desarrolloservidor.pruebaTransversal.service.UsuarioService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UsuarioServiceImplement implements UsuarioService{

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	public UsuarioEntity registrarUsuario(UsuarioDTO usuarioDTO) {
        UsuarioEntity usuarioEntity = new UsuarioEntity();
        
        System.out.println(usuarioDTO.getUsername());
		usuarioEntity.setUserName(usuarioDTO.getUsername());
		usuarioEntity.setPassword(usuarioDTO.getPassword());
		System.out.println(usuarioEntity.getUserName());
		
		return usuarioRepository.save(usuarioEntity);
	}
	
	
}
