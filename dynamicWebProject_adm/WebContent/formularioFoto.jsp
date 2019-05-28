<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AltaCandidato</title>
</head>
<body>
<div>
	Asigne una foto al Candidato.
</div>

<!--
Este formulario solo puede contener input de tipo file, ya que el enctype es multipart/form-data
no se puede combinar con inputs de tipo text.
 -->
 
<form action="foto.jsp" method="post" enctype="multipart/form-data">
	<input type="file" name="file" size="50" style="width:500px;"/><br/>
	<input type="submit" value="Asignar Foto" />
</form>
</body>
</html>