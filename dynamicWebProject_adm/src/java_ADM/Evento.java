package java_ADM;

public class Evento {

	private int cod_evento;
	private int cod_campanna;
	private String descripcion;
	private String ubicacion;
	private String fecha;
	private String hora;
	private String nombre;
	private String municipio;
	
	//Constructor Vacío
		public Evento() {
			super();

		}
		
	//Constructor Main
	public Evento(int cod_evento, int cod_campanna, String descripcion, String ubicacion, String fecha, String hora,
			String nombre, String municipio) {
		super();
		this.cod_evento = cod_evento;
		this.cod_campanna = cod_campanna;
		this.descripcion = descripcion;
		this.ubicacion = ubicacion;
		this.fecha = fecha;
		this.hora = hora;
		this.nombre = nombre;
		this.municipio = municipio;
	}
	
	public Evento(int cod_campanna, String descripcion, String ubicacion, String fecha, String hora,
			String nombre, String municipio) {
		super();
		this.cod_campanna = cod_campanna;
		this.descripcion = descripcion;
		this.ubicacion = ubicacion;
		this.fecha = fecha;
		this.hora = hora;
		this.nombre = nombre;
		this.municipio = municipio;
	}

	//Getters & Setters
	public int getCod_evento() {
		return cod_evento;
	}

	public void setCod_evento(int cod_evento) {
		this.cod_evento = cod_evento;
	}

	public int getCod_campanna() {
		return cod_campanna;
	}

	public void setCod_campanna(int cod_campanna) {
		this.cod_campanna = cod_campanna;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getUbicacion() {
		return ubicacion;
	}

	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	@Override
	public String toString() {
		return "Evento [cod_evento=" + cod_evento + ", cod_campanna=" + cod_campanna + ", descripcion=" + descripcion
				+ ", ubicacion=" + ubicacion + ", fecha=" + fecha + ", hora=" + hora + ", nombre=" + nombre
				+ ", municipio=" + municipio + "]";
	}
	
	
	

}
