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
<title>Lista de asistentes al evento</title>
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
		int cod_evento = 0;

		ArrayList<Voluntario> asistentes = new ArrayList<Voluntario>();
		EventoExtra evento = new EventoExtra();

		BD_Controller controladorBD = new BD_Controller();

		if (request.getParameter("evento") == "") {
			operacion = false;
			mensaje += "<p>- Debe elegir un evento. </p>";
			response.sendRedirect("operacionRealizada.jsp?mensaje=" + mensaje + "&clase=" + clase);
		} else {

			String cod_eventoStr = request.getParameter("evento");
			cod_evento = Integer.parseInt(cod_eventoStr);

		}

		evento = controladorBD.dameEventoExtra(cod_evento);
		asistentes = evento.getAsistentes();
		//Evento evento = controladorBD.dameEvento(cod_evento);
		//asistentes = controladorBD.dameAsistentesEvento(cod_evento);
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
		<div style="margin: 50px;">
			<header class="major">
				<h2><%=evento.getNombre()%></h2>
			</header>
			<h5><%=evento.getUbicacion()%>
				(<%=evento.getMunicipio()%>)
			</h5>
			<i><%=evento.getFecha()%> - <%=evento.getHora()%></i>
			<p><%=evento.getDescripcion()%></p>
			<br> 
			<div class="pdf">
				<a href="word.jsp"><img src="images/word.jpg" 
					alt="WORD" height="64" width="64" style="margin:20px;"/></a> 
					
					<a href="excel.jsp"><img
					src="images/excel.jpg"  alt="EXCEL" height="64"
					width="64" style="margin:20px;"/></a>
			</div>

			<table id="eventos">

				<tr>
					<th>#</th>
					<th>Nombre</th>
					<th>Email</th>
					<th>Telefono</th>

				</tr>

				<tbody>

					<%
						for (int i = 0; i < asistentes.size(); i++) {
					%><tr>
						<th><%=(i + 1)%></th>
						<td><%=asistentes.get(i).getNombre()%> <%=asistentes.get(i).getApellidos()%></td>
						<td><%=asistentes.get(i).getEmail()%></td>
						<td><%=asistentes.get(i).getTelefono()%></td>
					</tr>
					<%
						}
						session.setAttribute("evento", evento);
					%>


				</tbody>




			</table>


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
</body>
</html>