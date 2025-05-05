package com.desarrolloservidor.pruebaTransversal.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;

import java.io.Serializable;

import jakarta.persistence.*;

@Entity
@Table(name="USUARIO")
public class UsuarioEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
    @Id
	@Column(name = "USER_NAME", unique = true, nullable = false)
    private String userName;
    
    @Column(name = "USER_PASSWORD")
    private String password;
    

    // Getters y Setters

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}

