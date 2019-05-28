package java_ADM;

import java.util.ArrayList;

public class CampannaExtra extends Campanna {


	private ArrayList<Candidato> candidatos = new ArrayList<Candidato>();
	private ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();
	private ArrayList<Programa> programas = new ArrayList<Programa>();
	private ArrayList<Evento> eventos = new ArrayList<Evento>();
	private ArrayList<Noticia> noticias = new ArrayList<Noticia>();
	
	//Constructor Main

	public CampannaExtra(int cod_campanna, String tipo, String ambito,ArrayList<Candidato> candidatos,ArrayList<Voluntario> voluntarios, ArrayList<Programa> programas,
			ArrayList<Evento> eventos, ArrayList<Noticia> noticias) {

	super(cod_campanna,tipo,ambito);
	
	this.candidatos = candidatos;
	this.voluntarios = voluntarios;
	this.programas = programas;
	this.eventos = eventos;
	this.noticias = noticias;
	}
	
	
}
