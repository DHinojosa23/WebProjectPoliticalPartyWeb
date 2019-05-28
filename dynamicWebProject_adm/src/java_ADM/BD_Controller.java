package java_ADM;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Hashtable;

public class BD_Controller {

	private Connection miConexion;

	PreparedStatement consultaPrepExisteCandidato;
	PreparedStatement consultaPrepExisteVoluntario;
	PreparedStatement consultaPrepExisteVoluntarioNombreyApellidos;
	PreparedStatement consultaPrepExisteCampanna;
	PreparedStatement consultaPrepExisteEvento;
	PreparedStatement consultaPrepExisteNoticia;
	PreparedStatement consultaPrepExistePrograma;

	// constructor vacío con la conexión creada y consultas preparadas
	public BD_Controller() {
		super();
		try {
			// configuración la conexion con la BD.
			// ACCESO A BASES DE DATOS DESDE JSP
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// Ruta de nuestra base de datos
			this.miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/adm_bdd", "root", "");

			// usuario, contrasena para acceder a bdd
		} catch (SQLException e) {
			System.out.println("Error en constructor BDController" + e.getMessage());
		}

		String sqlconsultaPrepExisteCandidato = "SELECT * FROM candidatos WHERE cod_candidato=?";
		String sqlconsultaPrepExisteVoluntario = "SELECT * FROM voluntarios WHERE cod_voluntario=?";
		String sqlconsultaPrepExisteVoluntarioNombreyApellidos = "SELECT * FROM voluntarios WHERE nombre=? AND apellidos=?";
		String sqlconsultaPrepExisteCampanna = "SELECT * FROM campanna WHERE cod_campanna=?";
		String sqlconsultaPrepExisteEvento = "SELECT * FROM eventos WHERE cod_evento=?";
		String sqlconsultaPrepExisteNoticia = "SELECT * FROM noticias WHERE cod_noticia=?";
		String sqlconsultaPrepExistePrograma = "SELECT * FROM programa WHERE cod_punto=?";

		try {
			this.consultaPrepExisteCandidato = miConexion.prepareStatement(sqlconsultaPrepExisteCandidato);
			this.consultaPrepExisteVoluntario = miConexion.prepareStatement(sqlconsultaPrepExisteVoluntario);
			this.consultaPrepExisteVoluntarioNombreyApellidos = miConexion
					.prepareStatement(sqlconsultaPrepExisteVoluntarioNombreyApellidos);
			this.consultaPrepExisteCampanna = miConexion.prepareStatement(sqlconsultaPrepExisteCampanna);
			this.consultaPrepExisteEvento = miConexion.prepareStatement(sqlconsultaPrepExisteEvento);
			this.consultaPrepExisteNoticia = miConexion.prepareStatement(sqlconsultaPrepExisteNoticia);
			this.consultaPrepExistePrograma = miConexion.prepareStatement(sqlconsultaPrepExistePrograma);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Boolean existeCandidato(int cod_candidato) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteCandidato.setInt(1, cod_candidato);
			ResultSet rs = this.consultaPrepExisteCandidato.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeCandidato del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeEvento(int cod_evento) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteEvento.setInt(1, cod_evento);
			ResultSet rs = this.consultaPrepExisteEvento.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeEvento del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeNoticia(int cod_noticia) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteNoticia.setInt(1, cod_noticia);
			ResultSet rs = this.consultaPrepExisteNoticia.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeNoticia del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existePrograma(int cod_punto) {
		Boolean existe = false;

		try {
			this.consultaPrepExistePrograma.setInt(1, cod_punto);
			ResultSet rs = this.consultaPrepExistePrograma.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existePrograma del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeVoluntario(int cod_voluntario) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteVoluntario.setInt(1, cod_voluntario);
			ResultSet rs = this.consultaPrepExisteVoluntario.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeVoluntario del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeVoluntarioNombreyApellido(String nombre, String apellidos) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteVoluntarioNombreyApellidos.setString(1, nombre);
			this.consultaPrepExisteVoluntarioNombreyApellidos.setString(2, apellidos);

			ResultSet rs = this.consultaPrepExisteVoluntarioNombreyApellidos.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeVoluntarioNombreyApellido del BDController" + e.getMessage());
		}
		return existe;
	}

	public Boolean existeCampanna(int cod_campanna) {
		Boolean existe = false;

		try {
			this.consultaPrepExisteCampanna.setInt(1, cod_campanna);
			ResultSet rs = this.consultaPrepExisteCampanna.executeQuery();

			if (rs.first() == true) {
				existe = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeCampanna del BDController" + e.getMessage());
		}
		return existe;
	}

	// NO NECESITAMOS CREAR MÉTODOS PARA CALCULAR IDS, LA BASE DE DATO LAS
	// AUTOINCREMENTA

	// CREAMOS UN MÉTODO UTILIZANDO LA CLASE HASHTABLE

	public Hashtable<Integer, ArrayList<Candidato>> dameCandidatosPorCod_Campanna() {

		Hashtable<Integer, ArrayList<Candidato>> candidatos = new Hashtable<Integer, ArrayList<Candidato>>();

		ArrayList<Campanna> campannas = new ArrayList<Campanna>();
		campannas = dameCampannas();

		for (int i = 1; i <= campannas.size(); i++) {

			ArrayList<Candidato> candidatosAux = new ArrayList<Candidato>();

			try {
				Statement miStatement = this.miConexion.createStatement();

				ResultSet rs = miStatement.executeQuery(
						"SELECT candidatos.* FROM candidatos,candidaturas,campanna WHERE candidatos.cod_candidato = candidaturas.cod_candidato AND candidatos.cod_campanna = campanna.cod_campanna AND campanna.cod_campana='"
								+ i + "'");

				while (rs.next() == true) {
					candidatosAux.add(new Candidato(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
							rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
				}
				miStatement.close();
				rs.close();

			} catch (SQLException e) {
				System.out.println("Error en dameCandidatosPorCod_Campanna del BDController" + e.getMessage());
			}

			candidatos.put(i, candidatosAux);

		}

		return candidatos;

	}

	// MÉTODO HASHTABLE PARA OBTENER TIPO DE CAMPAÑA Y ÁMBITO

	public Hashtable<Integer, String> dameTipoyAmbitoCampanna() {

		Hashtable<Integer, String> campannasHash = new Hashtable<Integer, String>();

		ArrayList<Campanna> campannas = new ArrayList<Campanna>();
		campannas = dameCampannas();

		for (int i = 1; i <= campannas.size(); i++) {

			String tipoAmbito = campannas.get((i - 1)).getTipo() + " (" + campannas.get((i - 1)).getAmbito() + ")";
			campannasHash.put(i, tipoAmbito);

		}

		return campannasHash;

	}

	// MÉTODO HASHTABLE PARA OBTENER TIPO DE CAMPAÑA Y ÁMBITO

	public Hashtable<Integer, String> dameNombreCandidatoHashPorCampanna(int cod_campanna) {

		Hashtable<Integer, String> candidatoHash = new Hashtable<Integer, String>();

		ArrayList<Candidato> candidatos = new ArrayList<Candidato>();
		candidatos = dameCandidatosCampanna(cod_campanna);

		for (int i = 1; i <= candidatos.size(); i++) {

			String nombre = candidatos.get(i).getNombre() + " " + candidatos.get(i).getApellidos();
			candidatoHash.put(i, nombre);

		}

		return candidatoHash;

	}

	// MÉTODO HASHTABLE PARA OBTENER TIPO DE CAMPAÑA Y ÁMBITO

	public Hashtable<Integer, String> dameNombreCandidatoyPosicionHashPorCampanna(int cod_campanna) {

		Hashtable<Integer, String> candidatoHash = new Hashtable<Integer, String>();

		ArrayList<Candidato> candidatos = new ArrayList<Candidato>();
		candidatos = dameCandidatosCampanna(cod_campanna);

		int posicion = 0;

		for (int i = 1; i <= candidatos.size(); i++) {

			posicion = damePosicion(candidatos.get(i - 1).getCod_candidato(), cod_campanna);
			String nombre = candidatos.get(i - 1).getNombre() + " " + candidatos.get(i - 1).getApellidos();

			candidatoHash.put(posicion, nombre);

		}

		return candidatoHash;

	}

	// GETTERS

	public ArrayList<Campanna> dameCampannas() {
		ArrayList<Campanna> campannas = new ArrayList<Campanna>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM campanna order by cod_campanna asc");

			while (rs.next() == true) {
				campannas.add(new Campanna(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCampannas del BDController" + e.getMessage());
		}
		return campannas;
	}

	public int damePosicion(int cod_candidato, int cod_campanna) {
		int posicion = 0;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT posicion FROM candidaturas WHERE cod_campanna = "
					+ cod_campanna + " AND cod_candidato=" + cod_candidato + " order by cod_campanna asc");

			while (rs.next() == true) {
				posicion = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en damePosicion del BDController" + e.getMessage());
		}
		return posicion;
	}

	public Campanna dameCampanna(int cod_campanna) {
		Campanna campanna = new Campanna();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM campanna WHERE cod_campanna = " + cod_campanna + " order by cod_campanna asc");

			while (rs.next() == true) {
				campanna = new Campanna(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCampanna del BDController" + e.getMessage());
		}
		return campanna;
	}

	public Campanna dameCampannaPorAmbito(String ambito) {

		Campanna campanna = new Campanna();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement
					.executeQuery("SELECT * FROM campanna WHERE ambito = " + ambito + " order by cod_campanna asc");

			while (rs.next() == true) {
				campanna = new Campanna(rs.getInt(1), rs.getString(2), rs.getString(3));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCampannaPorAmbito del BDController" + e.getMessage());
		}
		return campanna;
	}

	public ArrayList<Campanna> dameCampannasMunicipales() {
		ArrayList<Campanna> campannas = new ArrayList<Campanna>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement
					.executeQuery("SELECT * FROM campanna WHERE tipo='Municipal' order by cod_campanna asc");

			while (rs.next() == true) {
				campannas.add(new Campanna(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCampannasMunicipales del BDController" + e.getMessage());
		}
		return campannas;
	}

	public ArrayList<Campanna> dameCampannasAutonomicas() {
		ArrayList<Campanna> campannas = new ArrayList<Campanna>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement
					.executeQuery("SELECT * FROM campanna WHERE tipo='Autonómica' order by cod_campanna asc");

			while (rs.next() == true) {
				campannas.add(new Campanna(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCampannasAutonomicas del BDController" + e.getMessage());
		}
		return campannas;
	}

	public ArrayList<CampannaExtra> dameCampannasExtra() {
		ArrayList<CampannaExtra> campannasExtra = new ArrayList<CampannaExtra>();
		ArrayList<Campanna> campannas = new ArrayList<Campanna>();
		ArrayList<Candidato> candidatos = new ArrayList<Candidato>();
		ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();
		ArrayList<Programa> programas = new ArrayList<Programa>();
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		ArrayList<Noticia> noticias = new ArrayList<Noticia>();

		// RELLENAR TODOS LOS ARRAYLIST Y CREAR MÉTODOS QUE TE DEN ESOS ARRAYLIST POR
		// COD_CAMPANNA
		campannas = dameCampannas();

		for (int i = 0; i < campannas.size(); i++) {
			candidatos = dameCandidatosCampanna(campannas.get(i).getCod_campanna());
			voluntarios = dameVoluntariosPorCod_Campanna(campannas.get(i).getCod_campanna());
			programas = dameProgramasPorCod_Campanna(campannas.get(i).getCod_campanna());
			eventos = dameEventosPorCod_Campanna(campannas.get(i).getCod_campanna());
			noticias = dameNoticiasPorCod_Campanna(campannas.get(i).getCod_campanna());

			CampannaExtra campannaExtra = new CampannaExtra(campannas.get(i).getCod_campanna(),
					campannas.get(i).getTipo(), campannas.get(i).getAmbito(), candidatos, voluntarios, programas,
					eventos, noticias);
			campannasExtra.add(campannaExtra);
		}

		return campannasExtra;
	}

	public ArrayList<Noticia> dameNoticias() {
		ArrayList<Noticia> noticias = new ArrayList<Noticia>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM noticias order by cod_noticia asc");

			while (rs.next() == true) {
				noticias.add(new Noticia(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameNoticias del BDController" + e.getMessage());
		}
		return noticias;
	}

	public ArrayList<Noticia> dameNoticiasPorCod_Campanna(int cod_campanna) {
		ArrayList<Noticia> noticias = new ArrayList<Noticia>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM noticias WHERE cod_campanna = " + cod_campanna + " order by cod_noticia asc");

			while (rs.next() == true) {
				noticias.add(new Noticia(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameNoticiasPorCod_Campanna del BDController" + e.getMessage());
		}
		return noticias;
	}

	public ArrayList<Voluntario> dameVoluntarios() {
		ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM voluntarios order by cod_voluntario asc");

			while (rs.next() == true) {
				voluntarios.add(new Voluntario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameVoluntarios del BDController" + e.getMessage());
		}
		return voluntarios;
	}

	public ArrayList<Voluntario> dameVoluntariosPorCod_Campanna(int cod_campanna) {
		ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT voluntarios.* FROM voluntarios,voluntariados WHERE voluntarios.cod_voluntarios=voluntariados.cod_voluntario AND voluntariados.cod_campanna = "
							+ cod_campanna + " order by cod_voluntario asc");

			while (rs.next() == true) {
				voluntarios.add(new Voluntario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameVoluntariosPorCod_Campanna del BDController" + e.getMessage());
		}
		return voluntarios;
	}

	public Voluntario dameVoluntarioPorNombreyApellidos(String nombre, String apellidos) {
		Voluntario voluntario = new Voluntario();

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM voluntarios WHERE nombre = '" + nombre + "' AND apellidos = '" + apellidos + "';");

			while (rs.next() == true) {
				voluntario = (new Voluntario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameVoluntarioPorNombreyApellidos del BDController" + e.getMessage());
		}
		return voluntario;
	}

	public ArrayList<Programa> dameProgramas() {
		ArrayList<Programa> programas = new ArrayList<Programa>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM programa order by cod_punto asc");

			while (rs.next() == true) {
				programas.add(new Programa(rs.getInt(1), rs.getString(2), rs.getInt(3)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameProgramas del BDController" + e.getMessage());
		}
		return programas;
	}

	public ArrayList<Programa> dameProgramasPorCod_Campanna(int cod_campanna) {
		ArrayList<Programa> programas = new ArrayList<Programa>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM programa WHERE cod_campanna = " + cod_campanna + " order by cod_punto asc");

			while (rs.next() == true) {
				programas.add(new Programa(rs.getInt(1), rs.getString(2), rs.getInt(3)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameProgramasPorCod_Campanna del BDController" + e.getMessage());
		}
		return programas;
	}

	public int dameCod_CampannaPorAmbito(String ambito) {
		int cod_campanna = 0;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement
					.executeQuery("SELECT cod_campanna FROM campannas WHERE ambito= '" + ambito + "'");

			if (rs.first() == true) {
				cod_campanna = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCod_CampannaPorAmbito del BDController" + e.getMessage());
		}

		return cod_campanna;
	}

	public ArrayList<Evento> dameEventos() {
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM eventos ORDER BY cod_evento ASC");

			while (rs.next() == true) {
				eventos.add(new Evento(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEventos del BDController" + e.getMessage());
		}
		return eventos;
	}

	public Evento dameEvento(int cod_evento) {
		Evento evento = new Evento();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM eventos WHERE cod_evento = " + cod_evento + ";");

			while (rs.next() == true) {
				evento = new Evento(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEvento del BDController" + e.getMessage());
		}
		return evento;
	}

	public ArrayList<Evento> dameProxEventos() {
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM eventos ORDER BY fecha ASC LIMIT 8");

			while (rs.next() == true) {
				eventos.add(new Evento(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameProxEventos del BDController" + e.getMessage());
		}
		return eventos;
	}

	public ArrayList<Evento> dameEventosPorCod_Campanna(int cod_campanna) {
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement
					.executeQuery("SELECT * FROM eventos WHERE cod_campanna = " + cod_campanna + " order by fecha asc");

			while (rs.next() == true) {
				eventos.add(new Evento(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEventosPorCod_Campanna del BDController" + e.getMessage());
		}
		return eventos;
	}

	public ArrayList<Evento> dameEventosPorTipo(String tipo) {
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT eventos.* FROM eventos,campanna WHERE eventos.cod_campanna=campanna.cod_campanna AND campanna.tipo = '"
							+ tipo + "' order by fecha asc");

			while (rs.next() == true) {
				eventos.add(new Evento(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEventosPorTipo del BDController" + e.getMessage());
		}
		return eventos;
	}

	public ArrayList<Voluntario> dameAsistentesEvento(int cod_evento) {
		ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT voluntarios.* FROM voluntarios,asistentes WHERE voluntarios.cod_voluntario=asistentes.cod_voluntario AND asistentes.cod_evento = "
							+ cod_evento + " order by cod_voluntario asc");

			while (rs.next() == true) {
				voluntarios.add(new Voluntario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameAsistentesEvento del BDController" + e.getMessage());
		}
		return voluntarios;
	}

	public ArrayList<Evento> dameEventosVoluntario(int cod_voluntario) {
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT eventos.* FROM eventos,asistentes WHERE eventos.cod_evento = asistentes.cod_evento AND asistentes.cod_voluntario= "
							+ cod_voluntario + "order by cod_evento asc");

			while (rs.next() == true) {
				eventos.add(new Evento(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameEventosVoluntario del BDController" + e.getMessage());
		}
		return eventos;
	}

	public ArrayList<EventoExtra> dameEventosExtra() {
		ArrayList<EventoExtra> eventosExtra = new ArrayList<EventoExtra>();
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();

		eventos = dameEventos();
		for (int i = 0; i < eventos.size(); i++) {
			voluntarios = dameAsistentesEvento(eventos.get(i).getCod_evento());
			EventoExtra eventoExtra = new EventoExtra(eventos.get(i).getCod_evento(), eventos.get(i).getCod_campanna(),
					eventos.get(i).getDescripcion(), eventos.get(i).getUbicacion(), eventos.get(i).getFecha(),
					eventos.get(i).getHora(), eventos.get(i).getNombre(), eventos.get(i).getMunicipio(), voluntarios);
			eventosExtra.add(eventoExtra);
		}

		return eventosExtra;
	}

	public EventoExtra dameEventoExtra(int cod_evento) {
		EventoExtra eventoExtra = new EventoExtra();
		Evento evento = new Evento();
		ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();

		evento = dameEvento(cod_evento);

		voluntarios = dameAsistentesEvento(cod_evento);
		eventoExtra = new EventoExtra(evento.getCod_evento(), evento.getCod_campanna(), evento.getDescripcion(),
				evento.getUbicacion(), evento.getFecha(), evento.getHora(), evento.getNombre(), evento.getMunicipio(),
				voluntarios);

		return eventoExtra;
	}
	

	public ArrayList<Asistente> dameAsistentes() {
		ArrayList<Asistente> asistentes = new ArrayList<Asistente>();
		ArrayList<Evento> eventos = new ArrayList<Evento>();
		ArrayList<Voluntario> voluntarios = new ArrayList<Voluntario>();

		voluntarios = dameVoluntarios();
		for (int i = 0; i < voluntarios.size(); i++) {
			eventos = dameEventosVoluntario(voluntarios.get(i).getCod_voluntario());
			Asistente asistente = new Asistente(voluntarios.get(i).getCod_voluntario(), voluntarios.get(i).getNombre(),
					voluntarios.get(i).getApellidos(), voluntarios.get(i).getFecha_nac(), voluntarios.get(i).getEmail(),
					voluntarios.get(i).getTelefono(), voluntarios.get(i).getAutoriza_com(),
					voluntarios.get(i).getAutoriza_gdpd(), eventos);
			asistentes.add(asistente);
		}

		return asistentes;
	}

	public Candidato dameCandidato(int cod_candidato) {
		Candidato candidato = new Candidato();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM candidatos WHERE cod_candidato = " + cod_candidato);

			while (rs.next() == true) {
				candidato = (new Candidato(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCandidato del BDController" + e.getMessage());
		}
		return candidato;
	}

	public int dameCod_campanna_Candidato(int cod_candidato) {
		int cod_campanna = 0;
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT candidaturas.cod_campanna FROM candidaturas WHERE cod_candidato = " + cod_candidato);

			while (rs.next() == true) {
				cod_campanna = rs.getInt(1);

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCod_campanna_Candidato del BDController" + e.getMessage());
		}
		return cod_campanna;
	}

	public ArrayList<Candidato> dameCandidatos() {
		ArrayList<Candidato> candidatos = new ArrayList<Candidato>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT * FROM candidatos order by cod_candidato asc");

			while (rs.next() == true) {
				candidatos.add(new Candidato(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCandidatos del BDController" + e.getMessage());
		}
		return candidatos;
	}

	public ArrayList<Candidato> dameCandidatosCampanna(int cod_campanna) {
		ArrayList<Candidato> candidatos = new ArrayList<Candidato>();
		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery(
					"SELECT candidatos.* FROM candidatos,candidaturas WHERE candidatos.cod_candidato = candidaturas.cod_candidato AND candidaturas.cod_campanna= "
							+ cod_campanna + " order by posicion asc");

			while (rs.next() == true) {
				candidatos.add(new Candidato(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));

			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCandidatosCampanna del BDController" + e.getMessage());
		}
		return candidatos;
	}

	public ArrayList<Candidato> dameCandidatosPorAmbito(String ambito) {
		ArrayList<Candidato> candidatos = new ArrayList<Candidato>();
		int cod_campanna = dameCod_CampannaPorAmbito(ambito);
		candidatos = dameCandidatosCampanna(cod_campanna);
		return candidatos;
	}

	// calculo de siguiente cod_candidato
	public int dameCod_CandidatoFotoNueva() {
		int cod_candidato = 0;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement
					.executeQuery("SELECT cod_candidato FROM candidatos ORDER BY cod_candidato desc LIMIT 1");

			if (rs.first() == true) {
				cod_candidato = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCod_CandidatoFotoNueva del BDController" + e.getMessage());
		}
		cod_candidato++;
		return cod_candidato;
	}

	public int CalcularCod_evento() {
		int cod_evento = 0;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT cod_evento FROM eventos ORDER BY cod_evento desc LIMIT 1");

			if (rs.first() == true) {
				cod_evento = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en CalcularCod_evento del BDController" + e.getMessage());
		}
		cod_evento++;
		return cod_evento;
	}

	public int CalcularCod_voluntario() {
		int cod_voluntario = 0;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement
					.executeQuery("SELECT cod_voluntario FROM voluntarios ORDER BY cod_voluntario desc LIMIT 1");

			if (rs.first() == true) {
				cod_voluntario = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en CalcularCod_voluntario del BDController" + e.getMessage());
		}
		cod_voluntario++;
		return cod_voluntario;
	}

	public int dameCod_EventoFotoNueva() {
		int cod_evento = 0;

		try {
			Statement miStatement = this.miConexion.createStatement();

			ResultSet rs = miStatement.executeQuery("SELECT cod_evento FROM eventos ORDER BY cod_evento desc LIMIT 1");

			if (rs.first() == true) {
				cod_evento = rs.getInt(1);
			}
			miStatement.close();
			rs.close();

		} catch (SQLException e) {
			System.out.println("Error en dameCod_EventoFotoNueva del BDController" + e.getMessage());
		}
		cod_evento++;
		return cod_evento;
	}

	// INSERTS

	public void insertarCandidatoBDD(Candidato candidato) {
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO candidatos VALUES ('" + candidato.getCod_candidato() + "', '"
					+ candidato.getNombre() + "', '" + candidato.getApellidos() + "', '" + candidato.getFecha_nac()
					+ "', '" + candidato.getLugar_nac() + "', '" + candidato.getMunicipio() + "', '"
					+ candidato.getProvincia() + "', '" + candidato.getAutonomia() + "')";
			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarCandidatoBDD del BDController" + e.getMessage());
		}
	}

	public void insertarCandidaturaBDD(int cod_candidato, int cod_campanna, int posicion) {
		int cabeza_lista = 0;
		if (posicion == 1) {
			cabeza_lista = 1;
		}
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO candidaturas VALUES ('" + cod_candidato + "', '" + cod_campanna + "', '"
					+ cabeza_lista + "', '" + posicion + "')";
			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarCandidaturaBDD del BDController" + e.getMessage());
		}
	}

	public void insertarVoluntarioBDD(Voluntario voluntario) {
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO voluntarios VALUES ('" + voluntario.getCod_voluntario() + "', '"
					+ voluntario.getNombre() + "', '" + voluntario.getApellidos() + "', '" + voluntario.getFecha_nac()
					+ "', '" + voluntario.getEmail() + "', '" + voluntario.getTelefono() + "', '"
					+ voluntario.getAutoriza_com() + "', '" + voluntario.getAutoriza_gdpd() + "');";

			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarVoluntarioBDD del BDController" + e.getMessage());
		}
	}

	public void insertarVoluntariadoBDD(int cod_voluntario, int cod_campanna) {
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO voluntariados VALUES ('" + cod_voluntario + "', '" + cod_campanna + "');";

			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarVoluntariadoBDD del BDController" + e.getMessage());
		}
	}

	public void insertarAsistenteBDD(int cod_evento, Voluntario voluntario) {
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO asistentes VALUES ('" + voluntario.getCod_voluntario() + "', '" + cod_evento
					+ "');";

			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarAsistenteBDD del BDController" + e.getMessage());
		}
	}

public void insertarEventoBDD(Evento evento) {
		
		System.out.println(evento.toString());
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "INSERT INTO eventos VALUES (" + evento.getCod_evento() + ", " + evento.getCod_campanna()
					+ ", '" + evento.getDescripcion() + "', '" + evento.getUbicacion()+ "', '" + evento.getFecha()+ "', '"
					+ evento.getHora()+ "', '"+ evento.getNombre() + "', '" + evento.getMunicipio() + "');";
			System.out.println(sql);
			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarEventoBDD del BDController" + e.getMessage());
		}
	}

public void insertarEventoPruebaBDD(Evento evento) {
	
	System.out.println(evento.toString());
	try {
		Statement miStatement = this.miConexion.createStatement();
		String sql = "INSERT INTO eventos VALUES (" + evento.getCod_evento() + ", " + evento.getCod_campanna()
				+ ", '" + evento.getDescripcion() + "', '" + evento.getUbicacion()+ "', '" + evento.getFecha()+ "', '"
				+ evento.getHora()+ "', '"+ evento.getNombre() + "', '" + evento.getMunicipio() + "');";
		System.out.println(sql);
		miStatement.executeUpdate(sql);
		miStatement.close();

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("Error en insertarEventoBDD del BDController" + e.getMessage());
	}
}



	// DELETES CANDIDATO

	public void borrarCandidatoBDD(int cod_candidato) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "DELETE FROM candidatos WHERE cod_candidato='" + cod_candidato + "'";
			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en borrarCandidatoBDD del BDController" + e.getMessage());
		}
	}

	// UPDATES CANDIDATO

	public void updateCandidatoBDD(int cod_candidato, Candidato candidato) {

		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "UPDATE candidatos SET nombre = '" + candidato.getNombre() + "', apellidos = '"
					+ candidato.getApellidos() + "',  fecha_nac = '" + candidato.getFecha_nac() + "',  lugar_nac = '"
					+ candidato.getLugar_nac() + "',  municipio = '" + candidato.getMunicipio() + "',  provincia = '"
					+ candidato.getProvincia() + "', autonomia = '" + candidato.getAutonomia()
					+ "' WHERE cod_candidato = " + cod_candidato + ";";

			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en updateCandidatoBDD del BDController" + e.getMessage());
		}
	}

	public void updateCandidaturaBDD(int cod_candidato, int cod_campanna, int posicion, int cod_campannaOld) {
		int cabeza_lista = 0;
		if (posicion == 1) {
			cabeza_lista = 1;
		}
		try {
			Statement miStatement = this.miConexion.createStatement();
			String sql = "UPDATE candidaturas SET cod_candidato = " + cod_candidato + ", cod_campanna = " + cod_campanna
					+ ", cabeza_lista = " + cabeza_lista + ", posicion = " + posicion + " WHERE cod_candidato = "
					+ cod_candidato + " AND cod_campanna = " + cod_campannaOld + ";";
			miStatement.executeUpdate(sql);
			miStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en updateCandidaturaBDD del BDController" + e.getMessage());
		}
	}

}
