package java_ADM;

import java.util.ArrayList;

public class EventoExtra extends Evento{
	
	private ArrayList<Voluntario> asistentes;

	//Constructor vacío
	public EventoExtra() {
		super();
		// TODO Auto-generated constructor stub
	}

	//Main constructor
	public EventoExtra(int cod_evento, int cod_campanna, String descripcion, String ubicacion, String fecha,
			String hora, String nombre, String municipio, ArrayList<Voluntario> asistentes) {
		super(cod_evento, cod_campanna, descripcion, ubicacion, fecha, hora, nombre, municipio);
		// TODO Auto-generated constructor stub
		
		this.asistentes=asistentes;
	}

	public ArrayList<Voluntario> getAsistentes() {
		return asistentes;
	}

	public void setAsistentes(ArrayList<Voluntario> asistentes) {
		this.asistentes = asistentes;
	}
	
	
	
	
	
	

}
