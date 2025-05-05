package com.desarrolloservidor.practicaBiblioteca.model;

public class LibroDTO {
	
	private int idLibro;
	private String titulo;
	private String autor;
	private String publicadoEn;
	private String ISBN;
	
	
	public LibroDTO() {
	}
	
	
	public LibroDTO(String titulo, String autor, String publicadoEn, String ISBN) {
		this.titulo = titulo;
		this.autor = autor;
		this.publicadoEn = publicadoEn;
		this.ISBN = ISBN;
	}


	public int getIdLibro() {
		return idLibro;
	}


	public void setIdLibro(int idLibro) {
		this.idLibro = idLibro;
	}


	public String getTitulo() {
		return titulo;
	}


	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}


	public String getAutor() {
		return autor;
	}


	public void setAutor(String autor) {
		this.autor = autor;
	}


	public String getPublicadoEn() {
		return publicadoEn;
	}


	public void setPublicadoEn(String publicadoEn) {
		this.publicadoEn = publicadoEn;
	}


	public String getISBN() {
		return ISBN;
	}


	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}


	@Override
	public String toString() {
		return "LibroDTO [idLibro=" + idLibro + ", titulo=" + titulo + ", autor=" + autor + ", publicadoEn="
				+ publicadoEn + ", ISBN=" + ISBN + "]";
	}


}
