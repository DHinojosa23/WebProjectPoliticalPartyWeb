<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java_ADM.*"%>
<%@ page import="java.util.*"%>


<!DOCTYPE HTML>
<!--
	Solarize by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Actualización de candidato</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>

<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />

<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

	<%
		String mensaje = "";
		String clase = "no";
		Boolean operacion = true;
		int cod_candidato = 0;
		int cod_campanna = 0;
		int posicion = 0;

		BD_Controller controladorBD = new BD_Controller();
		Campanna campanaEuropea = controladorBD.dameCampanna(1);
		Campanna campanaNacional = controladorBD.dameCampanna(2);
		ArrayList<Campanna> campannasNyE = new ArrayList<Campanna>();
		campannasNyE.add(campanaEuropea);
		campannasNyE.add(campanaNacional);
		ArrayList<Campanna> campannasAutonomicas = controladorBD.dameCampannasAutonomicas();
		ArrayList<Campanna> campannasMunicipales = controladorBD.dameCampannasMunicipales();

		if (request.getParameter("candidato") == "") {
			operacion = false;
			mensaje += "<p>- Debe elegir un candidato. </p>";
			response.sendRedirect("operacionRealizada.jsp?mensaje=" + mensaje + "&clase=" + clase);
		} else {

			String cod_candidatoStr = request.getParameter("candidato");
			cod_candidato = Integer.parseInt(cod_candidatoStr);
			
		}

		Candidato candidato = controladorBD.dameCandidato(cod_candidato);
		cod_campanna = controladorBD.dameCod_campanna_Candidato(cod_candidato);
		posicion = controladorBD.damePosicion(cod_candidato, cod_campanna);
				
	%>


	<!-- Header Wrapper -->
	<div class="wrapper style1">

		<!-- Header -->
		<div id="header">
			<div class="container">

				<!-- Logo -->
				<h1>
					<a href="index.jsp" id="logo">Amigos del mundo</a>
				</h1>

				<!-- Logo -->
				<h1>
					<a href="index.jsp" id="logo">Amigos Del Mundo</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="active"><img src="images/logo.png" width="30"
							height="30"><a href="index.jsp">Inicio</a></li>
						<li><a href="">Elecciones</a>
							<ul>
								<li><a href="nacionales.jsp">Nacionales</a></li>
								<li><a href="seleccionAutonomia.jsp">Autonómicas</a></li>
								<li><a href="seleccionMunicipio.jsp">Municipales</a></li>
								<li><a href="europeas.jsp">Europeas</a></li>
								<!--
											<li>
												<a href="">Phasellus consequat</a>
												<ul>
													<li><a href="#">Lorem ipsum dolor</a></li>
													<li><a href="#">Phasellus consequat</a></li>
													<li><a href="#">Magna phasellus</a></li>
													<li><a href="#">Etiam dolore nisl</a></li>
													<li><a href="#">Veroeros feugiat</a></li>
												</ul>
											</li>
										-->
							</ul></li>
						<li><a href="proxeventos.jsp">Próximos eventos</a></li>
						<li><a href="participa.jsp">Participa</a></li>

					</ul>
				</nav>

			</div>
		</div>
	</div>


	<!-- Main -->
	<div id="main" class="wrapper style4">
		<div id="formA">

			<form action="operaciones.jsp?tipo=modificarcandidato&campannaOld=<%=cod_campanna%>&cod_candidato=<%=cod_candidato%>&" method="post">
				<fieldset style="z-index: -1;">
					<p value="0" id="modificarcandidato"></p>

					<br> <input required="required" type="text" name="nombre" placeholder="Nombre"
						size="20" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+" value="<%=candidato.getNombre()%>"> <br> <input required="required" type="text"
						name="apellidos" placeholder="Apellidos" size="40" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+" value="<%=candidato.getApellidos()%>">
					<br> <br> <b>Lugar de Nacimiento:</b> <br>
					<br> <input type="text" name="lugar_nac"
						placeholder="Pais de nacimiento" size="40" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+" value="<%=candidato.getLugar_nac()%>">
					<br> <input type="text" name="autonomia"
						placeholder="Comunidad autónoma" size="40" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+" value="<%=candidato.getAutonomia()%>">
					<br> <input type="text" name="provincia"
						placeholder="Provincia" size="40" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+" value="<%=candidato.getProvincia()%>"> <br>
					<input type="text" name="municipio" placeholder="Municipio"
						size="40" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+" value="<%=candidato.getMunicipio()%>"> <br> <br> <label>
						Fecha de nacimiento: </label> <input required="required" type="date" name="fecha_nac" value="<%=candidato.getFecha_nac()%>">
					<br> <br> <select required name="campanna">
						<option value="" disabled selected="true">Campaña
							representante</option>
						<%
							for (int i = 0; i < campannasNyE.size(); i++) {
								
								if(campannasNyE.get(i).getCod_campanna()==cod_campanna){
						%>


						<option selected="selected" value="<%=campannasNyE.get(i).getCod_campanna()%>"><%=campannasNyE.get(i).getTipo()%>
						</option>
					<%
								}else{
									%>
									
									<option  value="<%=campannasNyE.get(i).getCod_campanna()%>"><%=campannasNyE.get(i).getTipo()%>
									</option>
									<%
								}

							}
						%>
						<optgroup label="Autonómicas">
							<%
								for (int i = 0; i < campannasAutonomicas.size(); i++) {
									
									if(campannasAutonomicas.get(i).getCod_campanna()==cod_campanna){
							%>

							<option
								 selected="selected" value="<%=campannasAutonomicas.get(i).getCod_campanna()%>"><%=campannasAutonomicas.get(i).getAmbito()%>
							</option>
							<%
								} else {
							%>

							<option
								value="<%=campannasAutonomicas.get(i).getCod_campanna()%>"><%=campannasAutonomicas.get(i).getAmbito()%>
							</option>
							<%
								}

								}
							%>
						</optgroup>
						<optgroup label="Municipales">
							<%
								for (int i = 0; i < campannasMunicipales.size(); i++) {
									
									if(campannasMunicipales.get(i).getCod_campanna()==cod_campanna){
							%>

							<option
								selected="selected" value="<%=campannasMunicipales.get(i).getCod_campanna()%>"><%=campannasMunicipales.get(i).getAmbito()%>
							</option>

							<%
								} else {
							%>

							<option
								value="<%=campannasMunicipales.get(i).getCod_campanna()%>"><%=campannasMunicipales.get(i).getAmbito()%>
							</option>
							<%
								}

								}
							%>
						</optgroup>
					</select> <br>
					<br> <input required="required" type="number" name="posicion"
						placeholder="Posición" size="5" min="1" value="<%=posicion%>">

				</fieldset>
				<br> <br> <input type="submit" name="Actualizar"
					value="Actualizar">

			</form>

		</div>
	</div>
<!-- Team -->
	<div class="wrapper style5">
		<section id="team" class="container">
			<header class="major">
				<h2>Amigos Del Mundo</h2>
				<span class="byline">Por un mundo mejor entre todos</span>
			</header>
			<div class="row">
				<div class="6u">
					<a href="nacionales.jsp" class="image"><img src="images/candidatos/1.jpg"
						alt="Frank Cuesta" width="250px"></a>
					<h3>Frank Cuesta</h3>
					<p>Candidato a la Presidencia Española</p>
				</div>
				<div class="6u">
					<a href="europeas.jsp" class="image"><img src="images/candidatos/4.jpg"
						alt="Al Gore" width="250px"></a>
					<h3 style=text-align: center;>Al Gore</h3>
					<p>Candidato al parlamento Europeo</p>
				</div>
				
			</div>
		</section>
	</div>

	<!-- Footer -->
	<div id="footer" style="background: #4e3b31;">
			<section class="container">
				<ul class="icons">
					<li class="active"><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
					<li><a href="#" class="fa fa-twitter"><span>Twitter</span></a></li>
					<li><a href="#" class="fa fa-google-plus"><span>Google+</span></a></li>
				</ul>
			</section>
			

		</div>
	<script src="js/dropdown.js"></script>
</body>
</html>