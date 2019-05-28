
var puntoCorto;
var puntoCompleto;


function mostrar(clicked_id) {
  puntoCorto = document.getElementById(clicked_id);
  puntoCompleto = document.getElementById(clicked_id+"completo");
  
  puntoCorto.classList.remove('mostrar');
  puntoCorto.classList.add('ocultar');
  
  puntoCompleto.classList.remove('ocultar');
  puntoCompleto.classList.add('mostrar');
}

function ocultar(clicked_id) {
	puntoCorto = document.getElementById(clicked_id);
	puntoCompleto = document.getElementById(clicked_id);
	
	  puntoCorto.classList.remove('mostrar');
	  puntoCorto.classList.add('ocultar');
	  
	  puntoCompleto.classList.remove('mostrar');
	  puntoCompleto.classList.add('ocultar');
	}