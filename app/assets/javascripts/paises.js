$(document).ready(function() {

	$('#paises').dataTable({
    "fnDrawCallback": function(){
      hoverBackgroundTable();
    },
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
  	"sPaginationType": "bootstrap",
    "bSortClasses": false,
  	"oLanguage": {
     	"sSearch" : "Buscar:"
    }
	});

});