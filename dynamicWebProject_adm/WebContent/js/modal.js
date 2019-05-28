var modal = document.getElementById('modal');

var cerrar = document.getElementsByClassName("close")[0];
var objeto;

//Cuando el usuario haga click en el nombre, se abrirá el modal 
function info(clicked_id) {
	objeto = document.getElementById("candidatoModal"+clicked_id)
	  objeto.classList.remove('ocultar');
	  objeto.classList.add('mostrar');
  document.getElementById("modal").style.display = "block";
}

// Cuando el usuario haga click en la X o fuera, se cerrará el modal
cerrar.onclick = function(clicked_id) {
  modal.style.display = "none";
  objeto.classList.remove('mostrar');
  objeto.classList.add('ocultar');
}

window.onclick = function(event){

	if(event.target == modal){
		modal.style.display = 'none';
		  objeto.classList.remove('mostrar');
		  objeto.classList.add('ocultar');

	}

}