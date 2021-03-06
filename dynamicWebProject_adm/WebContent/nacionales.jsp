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
<title>Elecciones nacionales</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta charset="ISO-8859-1">
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<link rel="stylesheet" href="css/modal.css" />
<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

	<%
		BD_Controller controladorBD = new BD_Controller();
		ArrayList<Programa> programaNacional = controladorBD.dameProgramasPorCod_Campanna(2);
		ArrayList<Candidato> candidatosNacional = controladorBD.dameCandidatosCampanna(2);

		Hashtable<Integer, String> posicionCandidato = new Hashtable<Integer, String>();
		posicionCandidato = controladorBD.dameNombreCandidatoyPosicionHashPorCampanna(2);

		/*String candidato = posicionCandidato.get(1);
		System.out.println(candidato);*/
	%>

	<!-- Header Wrapper -->
	<div class="wrapper style1">

		<!-- Header -->
		<div id="header">
			<div class="container">

				<!-- Logo -->
				<h1>
					<a href="index.jsp" " id="logo">Amigos Del Mundo</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="active"><img src="images/logo.png" width="30"
							height="30"><a href="index.jsp"">Inicio</a></li>
						<li><a href="">Elecciones</a>
							<ul>
								<li><a href="nacionales.jsp">Nacionales</a></li>
								<li><a href="seleccionAutonomia.jsp">Auton�micas</a></li>
								<li><a href="seleccionMunicipio.jsp">Municipales</a></li>
								<li><a href="europeas.jsp"">Europeas</a></li>
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
						<li><a href="proxeventos.jsp">Pr�ximos eventos</a></li>
						<li><a href="participa.jsp"">Participa</a></li>

					</ul>
				</nav>

			</div>
		</div>
	</div>

	<!-- Main -->
	<div id="main" class="wrapper style4">
		<div class="container">
			<div class="row">

				<!-- Content -->
				<div id="content" class="8u skel-cell-important">
					<section>
						<header class="major">
							<h2>PROGRAMA NACIONAL</h2>
							<span class="byline">Propuestas Electorales 2019</span>
						</header>
						<p>Por una Espa�a que luche por la Tierra.</p>
						<br>
						<p>Puntos a destacar:</p>
						<br>
						<ol>
							<%
								for (int i = 0; i < programaNacional.size(); i++) {

									String puntoCorto = programaNacional.get(i).getDescripcion().substring(0, 30) + "...";
							%>
							<li id="punto<%=programaNacional.get(i).getCod_punto()%>"
								onclick="mostrar(this.id)" class="pulsable"><%=(i + 1) + ". " + puntoCorto%></li>
							<li id="punto<%=programaNacional.get(i).getCod_punto()%>completo"
								class="pulsable ocultar"><%=(i + 1) + ". " + programaNacional.get(i).getDescripcion()%></li>

							<%
								}
							%>

						</ol>

					</section>
				</div>

				<!-- Sidebar -->
				<div id="sidebar" class="4u">
					<section>
						<header class="major">
							<h2>Candidatos</h2>
						</header>
						<ul class="default">

							<%
								for (int i = 0; i < candidatosNacional.size(); i++) {
									if (i == 0) {
							%>

							<li id="<%=candidatosNacional.get(i).getCod_candidato()%>"
								onclick="info(this.id)" style="color: green;" class="pulsable"><%=(i + 1) + ". " + posicionCandidato.get(i + 1)%></li>
							<%
									} else {
							%>

							<li id="<%=candidatosNacional.get(i).getCod_candidato()%>"
								onclick="info(this.id)" class="pulsable"><%=(i + 1) + ". " + posicionCandidato.get(i + 1)%></li>


							<%
									}

								}
							%>

						</ul>
						<!-- Modal -->
						<div id="modal" class="modal">
							<!-- Modal content -->
							<div class="modal-content ">
								<span class="close">&times;</span>
								<%
									for (int i = 0; i < candidatosNacional.size(); i++) {
								%>
								<div
									id="candidatoModal<%=candidatosNacional.get(i).getCod_candidato()%>"
									class="ocultar">
									<img class="foto"
										src="images/candidatos/<%=candidatosNacional.get(i).getCod_candidato()%>.jpg" />
									<div class="info">
										<h2><%=candidatosNacional.get(i).getNombre() + " " + candidatosNacional.get(i).getApellidos()%></h2>
										<p><%=candidatosNacional.get(i).getFecha_nac()%></p>
										<p><%=candidatosNacional.get(i).getMunicipio()%></p>
									</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</section>
				</div>

			</div>
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
					<a href="nacionales.jsp" class="image"><img
						src="images/candidatos/1.jpg" alt="Frank Cuesta" width="250px"></a>
					<h3>Frank Cuesta</h3>
					<p>Candidato a la Presidencia Espa�ola</p>
				</div>
				<div class="6u">
					<a href="europeas.jsp" class="image"><img
						src="images/candidatos/4.jpg" alt="Al Gore" width="250px"></a>
					<h3 style="text-align: center;">Al Gore</h3>
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
	<script src="js/modal.js"></script>
	<script src="js/desplegable.js"></script>
</body>
</html>