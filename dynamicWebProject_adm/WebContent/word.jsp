<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java_ADM.*"%>
<%@ page import="java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Word</title>
</head>
<body>

<%

ArrayList<Voluntario> asistentes = new ArrayList<Voluntario>();
EventoExtra evento = new EventoExtra();
evento = (EventoExtra) session.getAttribute("evento");
asistentes = evento.getAsistentes();
response.setContentType("application/vnd.ms-word");
response.setHeader("Content-Disposition", "inline; filename=Evento"+evento.getNombre()+".doc");
%>
<header class="major">
				<h2><%=evento.getNombre()%></h2>
			</header>
			<h5><%=evento.getUbicacion()%>
				(<%=evento.getMunicipio()%>)
			</h5>
			<i><%=evento.getFecha()%> - <%=evento.getHora()%></i>
			<p><%=evento.getDescripcion()%></p>
			
		<b>ASISTENTES</b>

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
					session.setAttribute("asistente", asistentes);
					%>


				</tbody>




			</table>

</body>
</html>