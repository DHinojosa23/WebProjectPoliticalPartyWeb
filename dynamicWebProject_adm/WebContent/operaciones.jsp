<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java_ADM.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADM</title>
</head>
<body>
	<%
		BD_Controller controladorBD = new BD_Controller();

		if (request.getParameter("tipo").equalsIgnoreCase("altaevento")) {

			int cod_campanna = 0;
			String nombre = "";
			String desc = "";
			String ubi = "";
			String fecha = "";
			String hora = "";
			String municipio = "";

			int cod_evento = controladorBD.CalcularCod_evento();

			boolean operacion = true;
			String mensaje = "";
			String clase = "no";
			// con la clase manejamos si pediremos foto o no al finalizar el formulario

			if (request.getParameter("campanna") == "") {
				operacion = false;
				mensaje += "<p>- Se debe elegir una campaña.</p>";
			}

			if (request.getParameter("nombre") == "") {
				operacion = false;
				mensaje += "<p>- El nombre del evento no puede ser un campo vacío.</p> ";
			}

			if (request.getParameter("descripcion") == "") {
				operacion = false;
				mensaje += "<p>- La descripción del evento no puede ser un campo vacío.</p> ";
			}

			if (request.getParameter("ubicacion") == "") {
				operacion = false;
				mensaje += "<p>- La ubicación del evento no puede ser un campo vacío.</p> ";
			}

			if (request.getParameter("fecha") == "") {
				operacion = false;
				mensaje += "<p>- La fecha del evento no puede ser un campo vacío.</p> ";
			}

			if (request.getParameter("hora") == "") {
				operacion = false;
				mensaje += "<p>- La hora del evento no puede ser un campo vacío.</p> ";
			}

			if (request.getParameter("municipio") == "") {
				operacion = false;
				mensaje += "<p>- El municipio del evento no puede ser un campo vacío.</p> ";
			}

			if (operacion == true) {

				cod_campanna = Integer.parseInt(request.getParameter("campanna"));
				nombre = request.getParameter("nombre");
				desc = request.getParameter("descripcion");
				ubi = request.getParameter("ubicacion");
				fecha = request.getParameter("fecha");
				hora = request.getParameter("hora");
				municipio = request.getParameter("municipio");

				Evento evento = new Evento(cod_evento, cod_campanna, desc, ubi, fecha, hora, nombre, municipio);
				controladorBD.insertarEventoPruebaBDD(evento);

				mensaje = "Se ha insertado el evento en la base de datos correctamente";
				clase = "evento";
			}

			response.sendRedirect("operacionesRealizadas.jsp?mensaje=" + mensaje + "&clase=" + clase);

		}

		if (request.getParameter("tipo").equalsIgnoreCase("altacandidato")) {

			String nombre = "";
			String apellidos = "";
			String fecha_nac = "";
			String lugar_nac = "";
			String municipio = "";
			String provincia = "";
			String autonomia = "";
			int cod_campanna = 0;
			int cod_candidato = 0;
			int posicion = 0;

			boolean operacion = true;
			String mensaje = "";
			String clase = "no";

			if (request.getParameter("nombre") == "") {
				operacion = false;
				mensaje += "<p>- El campo nombre no puede ser un campo vacío.</p> ";
			}

			if (request.getParameter("apellidos") == "") {
				operacion = false;
				mensaje += "<p>- El campo apellidos no puede ser un campo vacío.</p>";
			}

			if (request.getParameter("fecha_nac") == "") {
				operacion = false;
				mensaje += "<p>- El campo fecha_nac no puede ser un campo vacío.</p>";
			}

			if (request.getParameter("lugar_nac") == "") {
				operacion = false;
				mensaje += "<p>- El campo lugar_nac no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("municipio") == "") {
				operacion = false;
				mensaje += "<p>- El campo municipio no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("provincia") == "") {
				operacion = false;
				mensaje += "<p>- El campo provincia no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("autonomia") == "") {
				operacion = false;
				mensaje += "<p>- El campo autonomia no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("campanna") == "") {
				operacion = false;
				mensaje += "<p>- Debe elegir una campaña para el candidato. </p>";
			}

			if (request.getParameter("posicion") == "") {
				operacion = false;
				mensaje += "<p>- Debe elegir una posición de lista para el candidato. </p>";
			}

			if (operacion == true) {

				nombre = request.getParameter("nombre");
				apellidos = request.getParameter("apellidos");
				fecha_nac = request.getParameter("fecha_nac");
				lugar_nac = request.getParameter("lugar_nac");
				municipio = request.getParameter("municipio");
				provincia = request.getParameter("provincia");
				autonomia = request.getParameter("autonomia");

				String posicionStr = request.getParameter("posicion");
				posicion = Integer.parseInt(posicionStr);

				cod_candidato = controladorBD.dameCod_CandidatoFotoNueva();

				String cod_campannaStr = request.getParameter("campanna");
				log(cod_campannaStr);
				cod_campanna = Integer.parseInt(cod_campannaStr);

				Candidato candidato = new Candidato(cod_candidato, nombre, apellidos, fecha_nac, lugar_nac,
						municipio, provincia, autonomia);
				controladorBD.insertarCandidatoBDD(candidato);

				controladorBD.insertarCandidaturaBDD(cod_candidato, cod_campanna, posicion);

				mensaje = "Se ha insertado el candidato y su candidatura en la base de datos correctamente";
				clase = "candidato";
			}

			response.sendRedirect("operacionesRealizadas.jsp?mensaje=" + mensaje + "&clase=" + clase);

		}

		if (request.getParameter("tipo").equalsIgnoreCase("bajacandidato")) {

			int cod_candidato = 0;
			boolean operacion = true;
			String mensaje = "";
			String clase = "no";

			if (request.getParameter("candidato") == "") {
				operacion = false;
				mensaje += "<p>- Debe elegir un candidato. </p>";
			}

			if (operacion == true) {

				String cod_candidatoStr = request.getParameter("candidato");

				cod_candidato = Integer.parseInt(cod_candidatoStr);
				controladorBD.borrarCandidatoBDD(cod_candidato);

				mensaje = "Se ha eliminado el candidato de la base de datos correctamente";

			}

			response.sendRedirect("operacionesRealizadas.jsp?mensaje=" + mensaje + "&clase=" + clase);

		}

		if (request.getParameter("tipo").equalsIgnoreCase("modificarcandidato")) {

			String nombre = "";
			String apellidos = "";
			String fecha_nac = "";
			String lugar_nac = "";
			String municipio = "";
			String provincia = "";
			String autonomia = "";

			int cod_campanna = 0;
			int cod_campannaOld = 0;
			int cod_candidato = 0;
			int posicion = 0;

			boolean operacion = true;
			String mensaje = "";
			String clase = "no";

			if (request.getParameter("nombre") == "") {
				operacion = false;
				mensaje += "<p>- El campo nombre no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("apellidos") == "") {
				operacion = false;
				mensaje += "<p>- El campo apellidos no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("fecha_nac") == "") {
				operacion = false;
				mensaje += "<p>- El campo fecha_nac no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("lugar_nac") == "") {
				operacion = false;
				mensaje += "<p>- El campo lugar_nac no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("municipio") == "") {
				operacion = false;
				mensaje += "<p>- El campo municipio no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("provincia") == "") {
				operacion = false;
				mensaje += "<p>- El campo provincia no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("autonomia") == "") {
				operacion = false;
				mensaje += "<p>- El campo autonomia no puede ser un campo vacío. </p>";
			}

			if (request.getParameter("campanna") == "" || request.getParameter("campanna") == "") {
				operacion = false;
				mensaje += "<p>- Debe elegir una campaña para el candidato. </p>";
			}

			if (request.getParameter("posicion") == "") {
				operacion = false;
				mensaje += "<p>- Debe elegir una posición de lista para el candidato. </p>";
			}

			if (operacion == true) {

				nombre = request.getParameter("nombre");
				apellidos = request.getParameter("apellidos");
				fecha_nac = request.getParameter("fecha_nac");
				lugar_nac = request.getParameter("lugar_nac");
				municipio = request.getParameter("municipio");
				provincia = request.getParameter("provincia");
				autonomia = request.getParameter("autonomia");

				String posicionStr = request.getParameter("posicion");
				posicion = Integer.parseInt(posicionStr);

				String cod_candidatoStr = request.getParameter("cod_candidato");
				cod_candidato = Integer.parseInt(cod_candidatoStr);

				String cod_campannaOldStr = request.getParameter("campannaOld");
				cod_campannaOld = Integer.parseInt(cod_campannaOldStr);

				String cod_campannaStr = request.getParameter("campanna");
				cod_campanna = Integer.parseInt(cod_campannaStr);

				Candidato candidato = new Candidato(nombre, apellidos, fecha_nac, lugar_nac, municipio, provincia,
						autonomia);
				controladorBD.updateCandidatoBDD(cod_candidato, candidato);
				controladorBD.updateCandidaturaBDD(cod_candidato, cod_campanna, posicion, cod_campannaOld);

				mensaje = "Se ha modificado la información sobre el candidato correctamente";
			}

			response.sendRedirect("operacionesRealizadas.jsp?mensaje=" + mensaje + "&clase=" + clase);

		}

		if (request.getParameter("tipo").equalsIgnoreCase("altavoluntario")) {

			Voluntario voluntario = new Voluntario();

			
			
			// los chekbox vacios dan un null, con un tick devuelven un on.

			String nombre = "";
			String apellidos = "";
			String fecha_nac = "";
			String email = "";
			String telefono = "";
			String autoriza_gdpdStr = "";
			String autoriza_comStr = "";
			String cod_campanaStr = "";


			int cod_campanna = 0;
			int cod_voluntario = 0;
			int autoriza_gdpd=1;
			int autoriza_com=1;

			boolean operacion = true;
			String mensaje = "";
			String clase = "no";

		
				if (request.getParameter("nombre") == "") {
					operacion = false;
					mensaje += "<p>- El campo nombre no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("apellidos") == "") {
					operacion = false;
					mensaje += "<p>- El campo apellidos no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("email") == "") {
					operacion = false;
					mensaje += "<p>- El campo email no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("telefono") == "") {
					operacion = false;
					mensaje += "<p>- El campo lugar_nac no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("fecha_nac") == "") {
					operacion = false;
					mensaje += "<p>- El campo municipio no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("autoriza_gdpd") == null) {
					operacion = false;
					mensaje += "<p>- Debe aceptar que los datos sean tratados según la GDPD. </p>";
				}
				

				if (operacion == true) {

					nombre = request.getParameter("nombre");
					apellidos = request.getParameter("apellidos");
					fecha_nac = request.getParameter("fecha_nac");
					email = request.getParameter("email");
					telefono = request.getParameter("telefono");
					
					autoriza_gdpdStr = request.getParameter("autoriza_gdpd");
					autoriza_comStr = request.getParameter("autoriza_com");
					
					//sabemos que va a estar en on porque si no no hubiesemos llegad oa este punto, pero confirmamos
					if(autoriza_gdpdStr.equalsIgnoreCase("on")){
						autoriza_gdpd = 1;
					}
					
					if (request.getParameter("autoriza_com") == null) {
						autoriza_com = 0;
					}
				
	

					String cod_campannaStr = request.getParameter("campanna");
					cod_campanna = Integer.parseInt(cod_campannaStr);
					
					cod_voluntario = controladorBD.CalcularCod_voluntario();

					voluntario = new Voluntario(cod_voluntario,nombre, apellidos, fecha_nac, email, telefono,
							autoriza_com, autoriza_gdpd);
					
					
					//inserciones en tablas: voluntarios, voluntariados y asistentes
					controladorBD.insertarVoluntarioBDD(voluntario);
					controladorBD.insertarVoluntariadoBDD(cod_voluntario, cod_campanna);
					
					
					mensaje = "Tu rgistro ha sido realizado con éxito";
				}
				
				response.sendRedirect("operacionesRealizadas.jsp?mensaje=" + mensaje + "&clase=" + clase);
			}


		if (request.getParameter("tipo").equalsIgnoreCase("altaasistente")) {

			Voluntario voluntario = new Voluntario();
			boolean existe = false;
			String nombreV = "";
			String apellidosV = "";
			
			
			// los chekbox vacios dan un null, con un tick devuelven un on.

			String nombre = "";
			String apellidos = "";
			String fecha_nac = "";
			String email = "";
			String telefono = "";
			String autoriza_gdpdStr = "";
			String autoriza_comStr = "";
			String cod_campanaStr = "";
			String cod_eventoStr = "";

			int cod_campanna = 0;
			int cod_voluntario = 0;
			int cod_evento = 0;
			int autoriza_gdpd=1;
			int autoriza_com=1;

			boolean operacion = true;
			String mensaje = "";
			String clase = "no";

			nombreV = request.getParameter("voluntarioN");
			apellidosV = request.getParameter("voluntarioA");
			existe = controladorBD.existeVoluntarioNombreyApellido(nombreV, apellidosV);

			if (existe == true) {
				voluntario = controladorBD.dameVoluntarioPorNombreyApellidos(nombreV, apellidosV);

				if (request.getParameter("evento") == "") {
					operacion = false;
					mensaje += "<p>- Debes elegir un evento al que asistir. </p>";
				}
				if (operacion == true) {
					
					cod_eventoStr = request.getParameter("evento");
					cod_evento = Integer.parseInt(cod_eventoStr);
					
					controladorBD.insertarAsistenteBDD(cod_evento, voluntario);
					mensaje = "Se ha confirmado tu asistencia al evento indicado";
				}

				response.sendRedirect("operacionesRealizadas.jsp?mensaje=" + mensaje + "&clase=" + clase);

			} if (existe == false) {

				if (request.getParameter("nombre") == "") {
					operacion = false;
					mensaje += "<p>- El campo nombre no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("apellidos") == "") {
					operacion = false;
					mensaje += "<p>- El campo apellidos no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("email") == "") {
					operacion = false;
					mensaje += "<p>- El campo email no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("telefono") == "") {
					operacion = false;
					mensaje += "<p>- El campo lugar_nac no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("fecha_nac") == "") {
					operacion = false;
					mensaje += "<p>- El campo municipio no puede ser un campo vacío. </p>";
				}

				if (request.getParameter("autoriza_gdpd") == null) {
					operacion = false;
					mensaje += "<p>- Debe aceptar que los datos sean tratados según la GDPD. </p>";
				}
				
				if (request.getParameter("evento") == "") {
					operacion = false;
					mensaje += "<p>- Debes elegir un evento al que asistir. </p>";
				}

				if (operacion == true) {

					nombre = request.getParameter("nombre");
					apellidos = request.getParameter("apellidos");
					fecha_nac = request.getParameter("fecha_nac");
					email = request.getParameter("email");
					telefono = request.getParameter("telefono");
					
					autoriza_gdpdStr = request.getParameter("autoriza_gdpd");
					autoriza_comStr = request.getParameter("autoriza_com");
					
					//sabemos que va a estar en on porque si no no hubiesemos llegad oa este punto, pero confirmamos
					if(autoriza_gdpdStr.equalsIgnoreCase("on")){
						autoriza_gdpd = 1;
					}
					
					if (request.getParameter("autoriza_com") == null) {
						autoriza_com = 0;
					}
				

					cod_eventoStr = request.getParameter("evento");
					cod_evento = Integer.parseInt(cod_eventoStr);
	

					String cod_campannaStr = request.getParameter("campanna");
					cod_campanna = Integer.parseInt(cod_campannaStr);
					
					cod_voluntario = controladorBD.CalcularCod_voluntario();

					voluntario = new Voluntario(cod_voluntario,nombre, apellidos, fecha_nac, email, telefono,
							autoriza_com, autoriza_gdpd);
					
					
					//inserciones en tablas: voluntarios, voluntariados y asistentes
					controladorBD.insertarVoluntarioBDD(voluntario);
					controladorBD.insertarVoluntariadoBDD(cod_voluntario, cod_campanna);
					controladorBD.insertarAsistenteBDD(cod_evento, voluntario);
					
					
					mensaje = "Se ha confirmado tu asistencia al evento indicado";
				}
				
				response.sendRedirect("operacionesRealizadas.jsp?mensaje=" + mensaje + "&clase=" + clase);
			}

			

		}
	%>

</body>
</html>