// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require wice_grid
//= require bootstrap
//= require twitter/bootstrap/rails/confirm
//= require dataTables/jquery.dataTables
//= require_tree .

$(document).ready(function(){

   	$('.delete_element').bind('ajax:success', function() {
		 $(this).closest('tr').fadeOut();
	});

	$('a.next').text('Siguiente');
	$('a.previous').text('Anterior');
	$('a.first').text('Primero');
	$('a.last').text('Último');
	$('table.dataTable tr').css("height","32px");

	$.fn.twitter_bootstrap_confirmbox.defaults = {
	    fade: true,
	    title: "Eliminar",
	    cancel: "Cancelar",
	    proceed: "Aceptar",
	    proceed_class: "btn proceed btn-danger"
	};

});
