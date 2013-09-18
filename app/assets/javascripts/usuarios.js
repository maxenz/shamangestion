$(document).ready(function() {
	tUsuarios = $('#usuarios').dataTable({
	    "fnDrawCallback": function(){
	      hoverBackgroundTable();
	    },
	    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	  	"sPaginationType": "bootstrap",
	    "iDisplayLength": 8,
	    "aLengthMenu": [[8, 10, 15, -1], [8, 10, 15, "All"]],
	    "aoColumnDefs": [
	      { "sWidth": "5%", "aTargets": [ 5,6] }
	    ],
	    "bSortClasses": false,
	  	"oLanguage": {
	     	"sSearch" : "Buscar:"
	    }
	});

});