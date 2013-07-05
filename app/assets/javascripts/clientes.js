$(document).ready(function() {

	tClientes = $('#clientes').dataTable({
	    "fnDrawCallback": function(){
	      hoverBackgroundTable();
	    },
	    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	  	"sPaginationType": "bootstrap",
	    "iDisplayLength": 8,
	    "aLengthMenu": [[8, 10, 15, -1], [8, 10, 15, "All"]],
	    "aoColumnDefs": [
	      { "sWidth": "5%", "aTargets": [ 6,7 ] }
	    ],
	    "bSortClasses": false,
	  	"oLanguage": {
	     	"sSearch" : "Buscar:"
	    }
	});

	tClienteContactos = $('#cliente_contactos').dataTable({
	    "fnDrawCallback": function(){
	      hoverBackgroundTable();
	    },
	    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	  	"sPaginationType": "bootstrap",
	    "iDisplayLength": 8,
	    "aLengthMenu": [[8, 10, 15, -1], [8, 10, 15, "All"]],
	    "aoColumnDefs": [
	      { "sWidth": "5%", "aTargets": [ 3,4 ] }
	    ],
	    "bSortClasses": false,
	  	"oLanguage": {
	     	"sSearch" : "Buscar:"
	    }
	});

});