package java_ADM;

public class Campanna {
	
	private int cod_campanna;
	private String tipo;
	private String ambito;
	
	//Constructor Vacío
	public Campanna() {
		super();

	}
	
	//Constructor Main
	public Campanna(int cod_campanna, String tipo, String ambito) {
		super();
		this.cod_campanna = cod_campanna;
		this.tipo = tipo;
		this.ambito = ambito;
	}
	
	
	//Getters & Setters

	public int getCod_campanna() {
		return cod_campanna;
	}

	public void setCod_campanna(int cod_campanna) {
		this.cod_campanna = cod_campanna;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getAmbito() {
		return ambito;
	}

	public void setAmbito(String ambito) {
		this.ambito = ambito;
	}

	
	
	
	
	

}
