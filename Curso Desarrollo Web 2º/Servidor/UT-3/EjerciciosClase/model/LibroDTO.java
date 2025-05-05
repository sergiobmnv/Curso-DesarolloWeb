package com.desarrolloservidor.practicaBiblioteca.model;

public class LibroDTO {
	
	private long idLibro;
	private String titulo;
	private String autor;
	private String publicadoEn;
	private String ISBN;
	private String estado;
	
	
	public LibroDTO() {
	}
	
	
	public LibroDTO(String titulo, String autor, String publicadoEn, String ISBN, String estado) {
		this.titulo = titulo;
		this.autor = autor;
		this.publicadoEn = publicadoEn;
		this.ISBN = ISBN;
	}


	public long getIdLibro() {
		return idLibro;
	}


	public void setIdLibro(long idLibro) {
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

	public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

	@Override
	public String toString() {
		return "LibroDTO [idLibro=" + idLibro + ", titulo=" + titulo + ", autor=" + autor + ", publicadoEn="
				+ publicadoEn + ", ISBN=" + ISBN + "]";
	}


}
