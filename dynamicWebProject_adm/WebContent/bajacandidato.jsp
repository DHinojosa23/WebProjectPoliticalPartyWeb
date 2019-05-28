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
<title>Baja de candidato</title>
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
		BD_Controller controladorBD = new BD_Controller();
		ArrayList<Candidato> candidatos = controladorBD.dameCandidatos();
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
		<div id="formA">

			<form action="operaciones.jsp?tipo=bajacandidato" method="post">
				<div style="z-index: 1;">
					<div class="dropdown">
						<button onclick="myFunctiondd()" class="dropbtn" type="button">Selecciona
							un candidato</button>
						<div id="myDropdown" class="dropdown-content">
						<!--  default selection as blank -->
						<a href="#"
											data-value=""
											onclick="seleccionarEvento(this)"><img
											
											style="width: 20%">-- Candidatos --<input
											type="hidden" name="candidato"
											value="" /></a>
						
							<%
											for (int i = 0; i < candidatos.size(); i++) {
										%>

										<a href="#"
											data-value="<%=candidatos.get(i).getCod_candidato()%>"
											onclick="seleccionarEvento(this)"><img
											src="images/candidatos_recortados/<%=candidatos.get(i).getCod_candidato()%>.jpg"
											style="width: 20%"> <%=candidatos.get(i).getNombre()%> <%=candidatos.get(i).getApellidos()%><input
											type="hidden" name="candidato"
											value="<%=candidatos.get(i).getCod_candidato()%>" /></a>

										<%
											}
										%>
						</div>
					</div>
				</div>
				<br> <input type="submit" name="Eliminar" value=Eliminar>

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