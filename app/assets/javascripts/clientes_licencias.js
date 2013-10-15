$(document).ready(function() {	

	$('.tbProductos').delegate('.verModulos', 'click', function (e) {
	    e.preventDefault();
	    var $prodId = $(this).parent('td').siblings('td').find('input').attr('value');
	    var $cliLicId = $('#cliLicId').attr("value");
	    setModulosOnModal($cliLicId,$prodId);
	});

	function moduloExcluido(id,vec) {

		for (var i = 0; i < vec.length; i++) {

			var idModExc = vec[i].id;

			if (id == idModExc) {

				return true;
			}
		}

		return false;

	}

	function setModulosOnModal(cliLicId,prodId) {

		var url = "set_modulos";
	    $.ajax({
		   	url: url,
		   	dataType: 'json',
		   	type: 'GET',
		   	data: {'pId' : prodId, 'clId' : cliLicId },
		   	success: function(data){

		   		$('#cliLicProdId').val(data.cliLicProdId);

		   		var modulosExc = data.seleccionModulos;

		   		$('#listModulosExcluir').html('');

		   		var prod = data.producto.descripcion;

		   		$('#listModulosExcluir').append("<li class=\"nav-header\" >"+prod+"</li><li class=\"divider\"></li>");

		   		for (var i = 0; i < data.modulos.length; i++) {

		   			var id = data.modulos[i].id;
		   			var descripcion = data.modulos[i].descripcion;

		   			if (moduloExcluido(id,modulosExc)) {

		   				$('#listModulosExcluir')
		   				.append("<li><a class=\"active\" id=\""+id+"\" href=\"#\">"+descripcion+"</a></li>");

		   			} else {

		   				$('#listModulosExcluir')
		   				.append("<li><a id=\""+id+"\" href=\"#\">"+descripcion+"</a></li>");
		   			}

		   		}

		   		$('#listModulosExcluir > li > a').each(function(){

		   			var modExcluido = $(this).attr("id");

		   		});

  				$('#modalMaxo').modal();

		   	}
	

	    });
	}

		$(document).on("click","ul#listModulosExcluir > li > a",function(e) {
			e.preventDefault();
			var idOpc = $(this).attr("id");
			if ($(this).hasClass("active")) {
				$(this).removeClass("active");
			} else {
				$(this).addClass("active");				
				
			}                 
		});

		$('#btnGuardarModulos').on('click',function(e){

			e.preventDefault();
			var vModExc = [];

			$("ul#listModulosExcluir > li > a").each(function(){

				var id = $(this).attr("id");

				if ($(this).hasClass("active")) {

					vModExc.push(id);
				}

			});
			var cliLicProdId = $('#cliLicProdId').val();
			var url = "guardar_borrar_modulos";
			$.ajax({
			   	url: url,
			   	dataType: 'json',
			   	type: 'POST',
			   	data: {'vModExc' : vModExc, 'cliLicProdId' : cliLicProdId },
			   	success: function(data){

			   		$('#modalMaxo').modal('hide');

		   		}
			});

		});
});