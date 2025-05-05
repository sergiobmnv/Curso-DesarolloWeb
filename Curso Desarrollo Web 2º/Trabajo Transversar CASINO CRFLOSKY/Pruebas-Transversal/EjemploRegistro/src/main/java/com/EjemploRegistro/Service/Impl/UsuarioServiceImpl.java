package com.EjemploRegistro.Service.Impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.EjemploRegistro.Entity.UsuarioEntity;
import com.EjemploRegistro.Model.UsuarioDTO;
import com.EjemploRegistro.Repo.UsuarioRepository;
import com.EjemploRegistro.Service.UsuarioService;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UsuarioServiceImpl implements UsuarioService{
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	public UsuarioEntity registrarUsuario(UsuarioDTO usuarioDTO) {
        UsuarioEntity usuarioEntity = new UsuarioEntity();
        
		usuarioEntity.setUsername(usuarioDTO.getUsername());
		usuarioEntity.setPwd(usuarioDTO.getPwd());
		System.out.println(usuarioEntity.getUsername());
		
		return usuarioRepository.save(usuarioEntity);
	}
	
	public UsuarioEntity encontrarPorID(String username) {
		Optional<UsuarioEntity> optional = usuarioRepository.findById(username);
		return optional.orElse(null);		
	}
	
	public UsuarioDTO validarUsuario(UsuarioEntity usuarioEntity,String pwd) {
		UsuarioDTO usuario = null;
		 if(usuarioEntity.getPwd().equals(pwd)) {
			usuario = new UsuarioDTO();
			usuario.setUsername(usuarioEntity.getUsername());
			usuario.setPwd(usuarioEntity.getPwd());	
			
		}
		 return usuario;
}}
