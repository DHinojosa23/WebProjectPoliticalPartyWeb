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
<title>Participa</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

	<%
		BD_Controller controladorBD = new BD_Controller();
		Campanna campanaEuropea = controladorBD.dameCampanna(1);
		Campanna campanaNacional = controladorBD.dameCampanna(2);
		ArrayList<Campanna> campannasNyE = new ArrayList<Campanna>();
		campannasNyE.add(campanaEuropea);
		campannasNyE.add(campanaNacional);
		ArrayList<Campanna> campannasAutonomicas = controladorBD.dameCampannasAutonomicas();
		ArrayList<Campanna> campannasMunicipales = controladorBD.dameCampannasMunicipales();
		ArrayList<Evento> eventos = controladorBD.dameEventos();
	%>

	<!-- Header Wrapper -->
	<div class="wrapper style1">

		<!-- Header -->
		<div id="header">
			<div class="container">
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
		<div id="botonesForm">

			<button class="button" onclick="elegirModo(this)">ASISTENTE</button>
			<button class="button" onclick="elegirModo(this)">VOLUNTARIO</button>

		</div>
		<!-- ASISTENTE -->
		<div id="formA">

			<form action="operaciones.jsp?tipo=altaasistente" method="post">
				<div style="z-index: 1;">
					<div class="dropdown">
						<button onclick="myFunctiondd()" class="dropbtn" type="button">Selecciona
							un evento</button>
						<div id="myDropdown" class="dropdown-content">
							<!--  default selection as blank -->
							<a href="#" data-value="" onclick="seleccionarEvento(this)"><img
								style="width: 20%">-- Eventos --<input type="hidden"
								name="candidato" value="" /></a>

							<%
								for (int i = 0; i < eventos.size(); i++) {
							%>

							<a href="#" data-value="<%=eventos.get(i).getCod_evento()%>"
								onclick="seleccionarEvento(this)"><img
								src="images/eventos/<%=eventos.get(i).getCod_evento()%>.jpg"
								style="width: 20%"> <%=eventos.get(i).getNombre()%><input
								type="hidden" name="evento"
								value="<%=eventos.get(i).getCod_evento()%>" /></a>

							<%
								}
							%>
						</div>
					</div>
				</div>


				<br>


				<fieldset style="z-index: -1;">
					<label>Si ya estás dado de alta como voluntario escribe
						aquí tu nombre y apellidos:</label> <input type="text" name="voluntarioN"
						placeholder="Nombre" size="25" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+"> <br>
					<input type="text" name="voluntarioA" placeholder="Apellidos"
						size="50" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+"> <br> <input
						type="submit" name="enviar" value="Asistir a Evento"> <br>
					<br> <label>Información personal:</label> <input type="text"
						name="nombre" placeholder="Nombre" size="25" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+">


					<br> <input type="text" name="apellidos"
						placeholder="Apellidos" size="50" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+"> <br>
						
						<label> Fecha de nacimiento: </label> <input
						type="date" name="fecha_nac">
						 <br>
						  <br>


					<input type="text" name="email" placeholder="E-mail" size="30"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}">
					<!-- https://stackoverflow.com/questions/5601647/html5-email-input-pattern-attribute -->
					<br> <input type="text" name="telefono"
						placeholder="Numero de teléfono" pattern="[0-9]{9}"> <br>


					<select name="campanna">
						<option value="" disabled selected="true">Seleccione
							Campaña</option>
						<%
							for (int i = 0; i < campannasNyE.size(); i++) {
						%>


						<option value="<%=campannasNyE.get(i).getCod_campanna()%>"><%=campannasNyE.get(i).getTipo()%>
						</option>

						<%
							}
						%>
						<optgroup label="Autonómicas">
							<%
								for (int i = 0; i < campannasAutonomicas.size(); i++) {
							%>

							<option
								value="<%=campannasAutonomicas.get(i).getCod_campanna()%>"><%=campannasAutonomicas.get(i).getAmbito()%>
							</option>

							<%
								}
							%>
						</optgroup>
						<optgroup label="Municipales">
							<%
								for (int i = 0; i < campannasMunicipales.size(); i++) {
							%>

							<option
								value="<%=campannasMunicipales.get(i).getCod_campanna()%>"><%=campannasMunicipales.get(i).getAmbito()%>
							</option>

							<%
								}
							%>
						</optgroup>
					</select> <br> 
				</fieldset>

				<br> <input type="checkbox" name="autoriza_gdpd"> <label>Acepto
					que los datos sean tratados según la GDPD</label> <br> <input
					type="checkbox" name="autoriza_com"> <label>Acepto
					el envío de comunicaciones</label> <br> <br> <input type="submit"
					name="enviar" value="Asistir a Evento">

			</form>
		</div>

		<!-- VOLUNTARIO -->

		<div id="formV">
			<form action="operaciones.jsp?tipo=altavoluntario" method="post">

				<br>
				<fieldset>
					<label>Información personal:</label> <input type="text"
						name="nombre" required="required" placeholder="Nombre" size="25" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+">


					<br> <input type="text" name="apellidos"
						placeholder="Apellidos" required="required" size="50" pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ\s]+"> <br>

					<label> Fecha de nacimiento: </label> <input type="date"
						name="fecha_nac" required="required"> <br> <br> <input required="required" type="text"
						name="email" placeholder="E-mail" size="30"
						pattern="[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}">
					<!-- https://stackoverflow.com/questions/5601647/html5-email-input-pattern-attribute -->
					<br> <input type="text" required="required" name="telefono"
						placeholder="Numero de teléfono" pattern="[0-9]{9}"> <br>


					<select required name="campanna">
						<option value="" disabled selected="true">Seleccione
							Campaña</option>
						<%
							for (int i = 0; i < campannasNyE.size(); i++) {
						%>


						<option value="<%=campannasNyE.get(i).getCod_campanna()%>"><%=campannasNyE.get(i).getTipo()%>
						</option>

						<%
							}
						%>
						<optgroup label="Autonómicas">
							<%
								for (int i = 0; i < campannasAutonomicas.size(); i++) {
							%>

							<option
								value="<%=campannasAutonomicas.get(i).getCod_campanna()%>"><%=campannasAutonomicas.get(i).getAmbito()%>
							</option>

							<%
								}
							%>
						</optgroup>
						<optgroup label="Municipales">
							<%
								for (int i = 0; i < campannasMunicipales.size(); i++) {
							%>

							<option
								value="<%=campannasMunicipales.get(i).getCod_campanna()%>"><%=campannasMunicipales.get(i).getAmbito()%>
							</option>

							<%
								}
							%>
						</optgroup>
					</select> <br> 
				</fieldset>

				<br> <input type="checkbox" name="autoriza_gdpd"> <label>Acepto
					que los datos sean tratados según la GDPD</label> <br> <input
					type="checkbox" name="autoriza_com"> <label>Acepto
					el envío de comunicaciones</label> <br> <br> <input type="submit"
					name="enviar" value="Registrarme">


			</form>
		</div>
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
	<script src="js/javascript.js"></script>
</body>
</html>