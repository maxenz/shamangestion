$(document).ready(function() {
	$('#localidades').dataTable({
			"sPaginationType": "full_numbers",
			"bJQueryUI": true,
			"sDom": '<"fg-toolbar ui-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix"lfr>t<"fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix"ip>'
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
