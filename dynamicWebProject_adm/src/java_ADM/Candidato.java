package java_ADM;

public class Candidato {
	
	private int cod_candidato;
	private String nombre;
	private String apellidos;
	private String fecha_nac;
	private String lugar_nac;
	private String municipio;
	private String provincia;
	private String autonomia;
	
	//Constructor vacío
	public Candidato() {
		super();
	}
	
	//Constructor Main
	public Candidato(int cod_candidato, String nombre, String apellidos, String fecha_nac, String lugar_nac,
			String municipio, String provincia, String autonomia) {
		super();
		this.cod_candidato = cod_candidato;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fecha_nac = fecha_nac;
		this.lugar_nac = lugar_nac;
		this.municipio = municipio;
		this.provincia = provincia;
		this.autonomia = autonomia;
	}
	
	public Candidato(String nombre, String apellidos, String fecha_nac, String lugar_nac,
			String municipio, String provincia, String autonomia) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fecha_nac = fecha_nac;
		this.lugar_nac = lugar_nac;
		this.municipio = municipio;
		this.provincia = provincia;
		this.autonomia = autonomia;
	}
	
	//Getters & Setters
	public int getCod_candidato() {
		return cod_candidato;
	}
	public void setCod_candidato(int cod_candidato) {
		this.cod_candidato = cod_candidato;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getFecha_nac() {
		return fecha_nac;
	}
	public void setFecha_nac(String fecha_nac) {
		this.fecha_nac = fecha_nac;
	}
	public String getLugar_nac() {
		return lugar_nac;
	}
	public void setLugar_nac(String lugar_nac) {
		this.lugar_nac = lugar_nac;
	}
	public String getMunicipio() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getAutonomia() {
		return autonomia;
	}
	public void setAutonomia(String autonomia) {
		this.autonomia = autonomia;
	}
	
	
	

}


