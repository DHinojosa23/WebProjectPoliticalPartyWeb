package java_ADM;

public class Noticia {
	
	private int cod_noticia;
	private String titulo;
	private String cuerpo;
	private int cod_campanna;
	
	//Constructor Vacío
	public Noticia() {
		super();
	}

	//Constructor Main
	public Noticia(int cod_noticia, String titulo, String cuerpo, int cod_campanna) {
		super();
		this.cod_noticia = cod_noticia;
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		this.cod_campanna = cod_campanna;
	}

	//Getters & Setters
	public int getCod_noticia() {
		return cod_noticia;
	}

	public void setCod_noticia(int cod_noticia) {
		this.cod_noticia = cod_noticia;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCuerpo() {
		return cuerpo;
	}

	public void setCuerpo(String cuerpo) {
		this.cuerpo = cuerpo;
	}

	public int getCod_campanna() {
		return cod_campanna;
	}

	public void setCod_campanna(int cod_campanna) {
		this.cod_campanna = cod_campanna;
	}
	
	
	
	

}
