$(document).ready(function() {
	$('#clientes').dataTable({
		"sPaginationType": "full_numbers",
		"bJQueryUI": true,
		"sDom": '<"fg-toolbar ui-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix"lfr>t<"fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix"ip>'
	});

	$('#cliente_contactos').dataTable({
		"sPaginationType": "full_numbers",
		"bJQueryUI": true,
		"sDom": '<"fg-toolbar ui-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix"lfr>t<"fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix"ip>'
	});

	
	$('.fg-toolbar').css("width","890px");

	});