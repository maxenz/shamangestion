$(document).ready(function() {

  tLocalidades = $('#localidades').dataTable({
    "fnDrawCallback": function(){
      hoverBackgroundTable();
    },
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "iDisplayLength": 8,
    "aLengthMenu": [[8, 10, 15, -1], [8, 10, 15, "All"]],
    "aoColumnDefs": [
      { "sWidth": "5%", "aTargets": [ 4,5 ] }
    ],
    "bSortClasses": false,
    "oLanguage": {
      "sSearch" : "Buscar:"
    }
  });

  $('#selectPaises').change(function() {
    
    var subcategory_url = "get_provincias?pais_id=" + $(this).val(); 
    var subcategory_select = $('#localidad_provincia_id');

    $.ajax({
      url: subcategory_url,
      success: function(data) {
        subcategory_select.removeAttr("disabled");
        var pSelectProv = "";
        for (var i = 0; i < data.length; i++) {

          pSelectProv = pSelectProv + "<option value=" + data[i].id + ">" + data[i].descripcion + "</option>";
        }
        subcategory_select.html("<option selected=selected>Seleccione Provincia</option>" + pSelectProv);

      }
    });
  });
});
