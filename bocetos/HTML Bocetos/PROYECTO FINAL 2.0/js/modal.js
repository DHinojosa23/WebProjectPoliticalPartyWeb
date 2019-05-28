var modal = document.getElementById('modal');

var candidato = document.getElementById("candidato");

var cerrar = document.getElementsByClassName("close")[0];

// When the user clicks, open the modal 
candidato.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on (x), close the modal
cerrar.onclick = function() {
  modal.style.display = "none";
}

