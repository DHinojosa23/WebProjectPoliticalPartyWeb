<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>	
	<%@ page import="java_ADM.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<!--
	Solarize by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Inicio</title>
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
<link rel="stylesheet" href="css/mostrarInfo.css"/>
	<link rel="stylesheet" href="css/skel.css" />
	<link rel="stylesheet" href="css/style.css" />


<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body class="homepage">


	<%
		BD_Controller controladorBD = new BD_Controller();
		ArrayList<Noticia> noticiasEuropa = controladorBD.dameNoticiasPorCod_Campanna(1);
		ArrayList<Evento> eventos = controladorBD.dameProxEventos();
		
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

		<!-- Banner -->
		<div id="banner">
			<section class="container">
				<img src="images/logo.png"> 
				<span class="sinF">Amigos Del Mundo</span>
				<p class="fondo">Déjanos cuidar de tu hogar</p>
			</section>
		</div>

	</div>

	<!-- Section One -->
	<div class="wrapper style2">
		<section class="container">
			<div class="row double">
				<div class="6u">
					<header >
						<h3>¿Qué podemos hacer para mejorar tu vida?</h3>
						<p>Desde nuestro partido creemos en un mundo mejor, en el que todos los seres vivos podamos convivir en armonía.
						Nuestro planeta necesita que tomemos acción y creemos que podemos salvar el mundo, pero necesitaremos vuestra ayuda, la de todos.
						Nuestra prioridad es salvar nuestro hogar, durante años el ser humano ha maltratado nuestro planeta, es hora de cuidarlo y tratarlo como se merece.</p>
					</header>
				</div>
				<div class="6u">
					<h3>Conoce un poco mejor a Amigos Del Mundo</h3>
					<p>En 2018, trás años de lucha a favor de la naturaleza, Frank Cuesta se decidió a tomar acción, reunió a un grupo de personas con sus mismos principios
					 y los convenció de darlo todo cada día por ayudar al planeta. Ese mismo año fundó ADM, con la intención de poder crear un mundo mejor.
					  Tenemos mucho recorrido y muchas luchas, el cambio climático, la deforestación, la contaminación, las especies en peligro de extinción y por supuesto 
					  las personas, nuestra prioridad.</p>
				</div>
			</div>
		</section>
	</div>

	<!-- Section Two -->
	<!-- <div class="wrapper style3">
				<section class="container">
					<header class="major">
						<h2>Cras vitae metus aliNuam</h2>
					</header>
					<p>Pellentesque pede. Donec pulvinar ullamcorper metus. In eu odio at lectus pulvinar mollis. Vestibulum sem magna, elementum vestibulum arcu.</p>
					<a href="#" class="button alt">Nulla aluctus eleifend</a>
				</section>
			</div>
		-->


	<!-- Section Three -->
	<div class="wrapper style4">
		<section class="container">
			<header class="major">
				<h2>Noticias</h2>
			</header>
			<div class="row flush">
			
			<%for (int i=0;i<noticiasEuropa.size();i++){ %>
			
				<div id="page" class="container">
					<div id="content2">
					
						<img src="images/noticias/<%=noticiasEuropa.get(i).getCod_noticia()%>.jpg" width="235" height="235" alt="" />
						<h2><%=noticiasEuropa.get(i).getTitulo() %></h2>
						<p><%=noticiasEuropa.get(i).getCuerpo() %></p>
					</div>

				</div>
				
				<%}%>
			

			</div>
		</section>
	</div>

	<!-- Eventos -->
	<div class="wrapper style5">
		<section id="team" class="container">
			<header class="major">
				<h2>Eventos</h2>
			</header>

			<div class="row">
			
				<%for (int i=0;i<eventos.size();i++){ %>
			
				<div class="3u">
				<div class="div-imagen onmouseover="mostrarTexto(this)"">
				<div class="descripcion"><%=eventos.get(i).getDescripcion()%></div>
					<a href="#" class="image">
					<img class="desvanecer" src="images/eventos/<%=eventos.get(i).getCod_evento()%>.jpg" alt=""  width="250" height="250">
					</a>
						
					<h3><%=eventos.get(i).getNombre()%></h3>
					<h4><%=eventos.get(i).getFecha()%></h4>
					<h4><%=eventos.get(i).getHora()%></h4>
					</div>
				</div>
				<%if (i==3){%>
				
				</div><div class='row'>
				
				<%}%>
				
				<%}%>
				
				
			</div>
		</section>
	</div>
	<div id="footer" style="background: #4e3b31;">
			<section class="container">
				<ul class="icons">
					<li class="active"><a href="#" class="fa fa-facebook"><span>Facebook</span></a></li>
					<li><a href="#" class="fa fa-twitter"><span>Twitter</span></a></li>
					<li><a href="#" class="fa fa-google-plus"><span>Google+</span></a></li>
				</ul>
			</section>
			

		</div>
	
	</div>
<script src="js/mostrarInfo.js"></script>
</body>
</html>