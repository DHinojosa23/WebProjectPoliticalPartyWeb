function elegirModo(elemento){
	if (elemento.innerHTML == "VOLUNTARIO") {
		document.getElementById("formV").style.display = "block";
		document.getElementById("formA").style.display = "none";
	}
	if (elemento.innerHTML == "ASISTENTE") {
		document.getElementById("formV").style.display = "none";
		document.getElementById("formA").style.display = "block";
	}
}