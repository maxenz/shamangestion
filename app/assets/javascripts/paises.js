$(document).ready(function() {
	$('#paises').dataTable({
			"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
  			"sPaginationType": "bootstrap",
  			"aoColumnDefs" : [
  				{ "sWidth" : "5%" , "aTargets": [ 2,3 ] },
  				{ "sWidth" : "60%" , "aTargets" : [ 1 ] },
  				{ "sWidth" : "30%" , "aTargets" : [ 0 ] }
  			],
  			"oLanguage": {
     			"sSearch" : "Buscar:"
    }
		});

});