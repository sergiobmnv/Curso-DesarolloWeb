package com.desarrolloservidor.practicaBiblioteca.model;

public class ReservaDTO {
	
	private String dniUsuario;
    private String nombreUsuario;
    private String isbnLibro;
    private String tituloLibro;
    private String devuelto;
	
    
    public ReservaDTO() {
	}
    
    
	public ReservaDTO(String dniUsuario, String nombreUsuario, String isbnLibro, String tituloLibro) {
		super();
		this.dniUsuario = dniUsuario;
		this.nombreUsuario = nombreUsuario;
		this.isbnLibro = isbnLibro;
		this.tituloLibro = tituloLibro;
		this.devuelto = "NO";
	}


	public String getDniUsuario() {
		return dniUsuario;
	}
	public void setDniUsuario(String dniUsuario) {
		this.dniUsuario = dniUsuario;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getIsbnLibro() {
		return isbnLibro;
	}
	public void setIsbnLibro(String isbnLibro) {
		this.isbnLibro = isbnLibro;
	}
	public String getTituloLibro() {
		return tituloLibro;
	}
	public void setTituloLibro(String tituloLibro) {
		this.tituloLibro = tituloLibro;
	}
	public String getDevuelto() {
		return devuelto;
	}
	public void setDevuelto(String devuelto) {
		this.devuelto = devuelto;
	}
	
	@Override
	public String toString() {
		return "ReservaDTO [dniUsuario=" + dniUsuario + ", nombreUsuario=" + nombreUsuario + ", isbnLibro=" + isbnLibro
				+ ", tituloLibro=" + tituloLibro + ", devuelto=" + devuelto + "]";
	}
    
}
