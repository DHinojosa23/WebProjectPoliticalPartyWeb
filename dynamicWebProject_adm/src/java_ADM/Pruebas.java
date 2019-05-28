package java_ADM;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.Hashtable;

public class Pruebas {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
	/*Hashtable<Integer, String> ambito_id = new Hashtable<Integer, String>();
	ambito_id.put(1, "EU");

	String ambito = ambito_id.get(1);
	
	if (ambito != null) {
		System.out.println("ambito = " + ambito);
	}
	
	
	Candidato candidato1 = new Candidato(); 
	candidato1.setNombre("Pedro Sánchez");
	
	Hashtable<Integer, Candidato> candidatos = new Hashtable<Integer, Candidato>();
	candidatos.put(1, candidato1);

	Candidato candidato2 = candidatos.get(1);
	if (ambito != null) {
		System.out.println("Candidato = " + candidato2.getNombre());
	}
	
	
	BD_Controller controladorBD = new BD_Controller();
	ArrayList<Evento> eventos = controladorBD.dameEventos();
	System.out.println(eventos.get(1).toString());*/
		
		BD_Controller controladorBD = new BD_Controller();
		ArrayList<Voluntario> voluntarios= new ArrayList<Voluntario>(); 
		voluntarios = controladorBD.dameAsistentesEvento(1);
		int resultado = voluntarios.size();
		System.out.println(resultado);

		Hashtable <Integer,String> codigoNombre = new Hashtable <Integer,String>();
		codigoNombre = controladorBD.dameTipoyAmbitoCampanna();
		String campanna = codigoNombre.get(14);
		System.out.println(campanna);
		
	}

}
