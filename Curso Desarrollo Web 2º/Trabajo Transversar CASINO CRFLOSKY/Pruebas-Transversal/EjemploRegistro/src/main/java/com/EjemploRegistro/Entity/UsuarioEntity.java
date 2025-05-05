package com.EjemploRegistro.Entity;

import java.io.Serializable;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="USUARIO")
public class UsuarioEntity implements Serializable {

	
	private static final long serialVersionUID = 1L;

		@Id
		@Column(name="USERNAME", unique = true, nullable = false)
		private String username;
		
		@Column(name="PWD")
		private String pwd;
		
		//GETTERS AND SETTERS
		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPwd() {
			return pwd;
		}

		public void setPwd(String pwd) {
			this.pwd = pwd;
		}
		
		
}
