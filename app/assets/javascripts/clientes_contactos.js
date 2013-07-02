$(document).ready(function() {

  $('#cliente_id').change(function() {
    
    var urlGetContactos = "get_contactos?cliente_id=" + $(this).val(); 

    $.ajax({
      url: urlGetContactos,
      success: function(data) {

          alert(data[0].nombre);

      }
    });
  });
});
