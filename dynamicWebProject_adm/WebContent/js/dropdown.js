/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunctiondd() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

function seleccionarEvento(elemento){
  var evento = document.getElementsByClassName("dropbtn")[0];
  var evento2 = document.getElementById("evento");
  evento.innerHTML = elemento.innerHTML;
  evento2.value = elemento.text;

}