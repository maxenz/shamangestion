$(document).ready(function() {

	tLogs = $('#visorLogs').dataTable({
    "fnDrawCallback": function(){
      hoverBackgroundTable();
    },
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
  	"sPaginationType": "bootstrap",
    "bSort": false,
    "iDisplayLength": 8,
    "aLengthMenu": [[8, 10, 15, -1], [8, 10, 15, "All"]],
    "bSortClasses": false,
  	"oLanguage": {
     	"sSearch" : "Buscar:"
    }
	});

});