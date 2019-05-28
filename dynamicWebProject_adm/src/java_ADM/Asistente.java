package java_ADM;

import java.util.ArrayList;

public class Asistente extends Voluntario{
	
	private ArrayList<Evento> eventos = new ArrayList<Evento>();
	
	
	//Constructor Main
	public Asistente(int cod_voluntario, String nombre, String apellidos, String fecha_nac, String email,
			String telefono, int autoriza_com, int autoriza_gdpd,ArrayList<Evento> eventos) {
		
		super(cod_voluntario,nombre,apellidos,fecha_nac,email,telefono,autoriza_com,autoriza_gdpd);
		
		this.eventos = eventos;
	}

	
	//Getters & Setters
	public ArrayList<Evento> getEventos() {
		return eventos;
	}


	public void setEventos(ArrayList<Evento> eventos) {
		this.eventos = eventos;
	}



	

}
