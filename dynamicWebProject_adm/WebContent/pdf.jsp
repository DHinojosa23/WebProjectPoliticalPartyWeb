    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
        <%@ page import="java_ADM.*" %>
        <%@ page import="java.awt.Desktop" %>
        <%@ page import="java.net.*" %> 
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Guru File</title>
    </head>
    <body>
    <%
    BD_Controller controladorBD = new BD_Controller();
    
    //Llamo al constructor de la clase que genera los pdf
    GeneratePDFFileIText generatePDFFileIText = new GeneratePDFFileIText();
    
    //Obtengo la ruta de la aplicación
    String filePath = application.getRealPath("/");
    filePath = filePath.replace("\\", "/");
    
    //Identifico que tipo de listado tengo que generar
    	ArrayList<Evento>eventos=controladorBD.dameEventos();

    	
    	//Llamo al constructor y le envío la ruta del documento que voy a generar y el arrayList de la entidad
    	//Aqui es donde se va a guardar el documento pdf
    	generatePDFFileIText.createPDFEventos(new File( filePath + "pdf/eventos.pdf"), eventos);
    	
    	//Ejecuto el documento pdf creado para que se abra.
    	Desktop d = Desktop.getDesktop();
    	URI uriBase = new URI(filePath + "pdf/eventos.pdf");
    	d.browse(uriBase);
    	
    	//mando el navegador a la página de jugadores.jsp
    	response.sendRedirect("proxeventos.jsp");	
    
    
    
    %>
    
    </body>
    </html>