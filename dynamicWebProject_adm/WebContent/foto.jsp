<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java_ADM.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
		BD_Controller controladorBD = new BD_Controller();
		String clase = request.getParameter("clase");

		//FOTO JUGADOR

		//Creamos un objeto file para meter la foto dentro
		File file;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;

		//Creamos la ruta donde tenemos la aplicación
		String filePath = application.getRealPath("/");
		filePath = filePath.replace("\\", "/");

		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(maxMemSize);
			factory.setRepository(new File("c:\\temp"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(maxFileSize);
			try {
				List fileItems = upload.parseRequest(request);
				Iterator i = fileItems.iterator();
				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						String fieldName = fi.getFieldName();
						String fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();

						//añadimos a la ruta de la aplicación la carpeta de las imágenes de jugadores y el nombre de la foto que será
						// el código del último jugador dado de alta + la extensión .png
						if (clase.equalsIgnoreCase("candidato")) {
							file = new File(filePath + "images/candidatos/"
									+ ((controladorBD.dameCod_CandidatoFotoNueva())-1) + ".jpg");
							// creamos el archivo
							fi.write(file);
							System.out.println("Foto subida con éxito: " + filePath + "images/candidatos/"
									+ ((controladorBD.dameCod_CandidatoFotoNueva())-1) + ".jpg");
						}

						if (clase.equalsIgnoreCase("evento")) {
							file = new File(filePath + "images/eventos/" + ((controladorBD.dameCod_EventoFotoNueva())-1)
									+ ".jpg");
							// creamos el archivo
							fi.write(file);
							System.out.println("Foto subida con éxito: " + filePath + "images/eventos/"
									+ ((controladorBD.dameCod_EventoFotoNueva())-1) + ".jpg");
						}

						
					}
				}

			} catch (Exception ex) {
				System.out.println(ex);
			}
		}

		String redirectURL = "index.jsp";
		response.sendRedirect(redirectURL);
	%>




</body>
</html>