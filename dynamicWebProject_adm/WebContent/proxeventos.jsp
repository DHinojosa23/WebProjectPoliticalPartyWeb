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
<title>Proximos eventos</title>
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

		ArrayList<Evento> eventosNacionales = controladorBD.dameEventosPorTipo("Nacional");
		ArrayList<Evento> eventosEuropeas = controladorBD.dameEventosPorTipo("Europea");
		ArrayList<Evento> eventosMunicipales = controladorBD.dameEventosPorTipo("Municipal");
		ArrayList<Evento> eventosAutonomicas = controladorBD.dameEventosPorTipo("Autonómica");
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

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="active"><img src="images/logo.png" width="30"
							height="30"><a href="index.jsp">Inicio</a></li>
						<li><a href="">Elecciones</a>
							<ul>
								<li><a href="nacionales.jsp">Nacionales</a></li>
								<li><a href="autonomicas.jsp">Autonómicas</a></li>
								<li><a href="municipales.jsp">Municipales</a></li>
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

		<!-- Main -->
		<div id="main" class="wrapper style4">

			<!-- Content -->
			<div id="content" class="container">
				<section>
					<header class="major">
						<h2>PRÓXIMOS EVENTOS</h2>

						<a href="pdf.jsp"><img src="images/PDF.png"
							class="pdf" alt="PDF" height="64" width="64" /></a>

					</header>
					<header class="major">
						<span class="byline"><b>- Campaña Europea -</b></span>
					</header>
					<!-- ponemos como limite el total de eventos porque no tenemos muchos en la base de datos, conforme rellenasemos el limite tendria que ser menor-->
					<%
						for (int i = 0; i < eventosEuropeas.size(); i++) {
					%>
					<p>
						<b><%=eventosEuropeas.get(i).getNombre()%></b> (<%=eventosEuropeas.get(i).getMunicipio()%>)
					</p>
					<p>
						<i><%=eventosEuropeas.get(i).getFecha()%> [<%=eventosEuropeas.get(i).getHora()%>]</i>
					</p>
					<p><%=eventosEuropeas.get(i).getDescripcion()%></p>
					<p><%=eventosEuropeas.get(i).getUbicacion()%></p>
					<br>

					<%
						}
					%>

					<header class="major">
						<span class="byline"><b>- Campaña Nacional -</b></span>
					</header>

					<%
						for (int i = 0; i < eventosNacionales.size(); i++) {
					%>
					<p>
						<b><%=eventosNacionales.get(i).getNombre()%></b> (<%=eventosNacionales.get(i).getMunicipio()%>)
					</p>
					<p>
						<i><%=eventosNacionales.get(i).getFecha()%> [<%=eventosNacionales.get(i).getHora()%>]</i>
					</p>
					<p><%=eventosNacionales.get(i).getDescripcion()%></p>
					<p><%=eventosNacionales.get(i).getUbicacion()%></p>
					<br>

					<%
						}
					%>

					<header class="major">
						<span class="byline"><b>- Campañas Municipales -</b></span>
					</header>

					<%
						for (int i = 0; i < eventosMunicipales.size(); i++) {
					%>
					<p>
						<b><%=eventosMunicipales.get(i).getNombre()%></b> (<%=eventosMunicipales.get(i).getMunicipio()%>)
					</p>
					<p>
						<i><%=eventosMunicipales.get(i).getFecha()%> [<%=eventosMunicipales.get(i).getHora()%>]</i>
					</p>
					<p><%=eventosMunicipales.get(i).getDescripcion()%></p>
					<p><%=eventosMunicipales.get(i).getUbicacion()%></p>
					<br>

					<%
						}
					%>

					<header class="major">
						<span class="byline"><b>- Campañas Autonómicas -</b></span>
					</header>

					<%
						for (int i = 0; i < eventosAutonomicas.size(); i++) {
					%>
					<p>
						<b><%=eventosAutonomicas.get(i).getNombre()%></b> (<%=eventosAutonomicas.get(i).getMunicipio()%>)
					</p>
					<p>
						<i><%=eventosAutonomicas.get(i).getFecha()%> [<%=eventosAutonomicas.get(i).getHora()%>]</i>
					</p>
					<p><%=eventosAutonomicas.get(i).getDescripcion()%></p>
					<p><%=eventosAutonomicas.get(i).getUbicacion()%></p>
					<br>

					<%
						}
					%>

				</section>
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
</body>
</html>