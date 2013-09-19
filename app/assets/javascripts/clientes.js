$(document).ready(function() {

	jQuery.extend( jQuery.fn.dataTableExt.oSort, {
		"date-uk-pre": function ( a ) {
		    var ukDatea = a.split('/');
		    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		},

		"date-uk-asc": function ( a, b ) {
		    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},

		"date-uk-desc": function ( a, b ) {
		    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		}
	});

	tClientes = $('#clientes').dataTable({
	"fnDrawCallback": function(){
	hoverBackgroundTable();
	},
	  	"sPaginationType": "bootstrap",
	    "iDisplayLength": 30,
	    "aLengthMenu": [[15, 30, 45, -1], [15, 30, 45, "All"]],
	    "bAutoWidth": false,
    	"aoColumnDefs": [
        	{ "sWidth": "25%", "aTargets": [ 0,1 ] },
        	{ "sWidth": "12%", "aTargets": [ 2,3,4,5,6,7 ] },
        	{ "sWidth": "2%", "aTargets": [ 8,9 ] },
      	],
	    "aoColumns": [
	        { "mDataProp": "razonSocial",
	        "fnRender": function(oObj){
	        	return restringirLength(oObj.aData.razonSocial);
	        } },
	        { "mDataProp": "email" },
	        { "mDataProp": "telefono" },
	        { "mDataProp" : "localidad.provincia.pais.descripcion"},
	       	{ "mDataProp" : "localidad.provincia.descripcion"},
	        { "mDataProp" : "localidad.descripcion"},
	        { "mDataProp": "dmPiso",	//puse dmAltura porque si no pones ninguno se buguea la tabla
                "bVisible" : false,
                "fnRender": function (oObj) {
                    return getGestion(oObj.aData.clientes_gestiones,1) ;
                }
            },
	        { "mDataProp": "localidad_id",	//puse localidad_id porque si no pones ninguno se buguea la tabla
                "bVisible" : false,
                "sType": "date-uk",
                "fnRender": function (oObj) {
                    return getGestion(oObj.aData.clientes_gestiones,0) ;
                }
            },  
	        { "mDataProp": "dmAltura",	//puse dmAltura porque si no pones ninguno se buguea la tabla
                "bSearchable": false,
                "bSortable": false,
                "fnRender": function (oObj) {
                    return '<a href=\"clientes/' + 
                    oObj.aData.id + '/edit\"><i class="icon-pencil icon-black"></i></a>';
                }
            },  	
	        { "mDataProp": "id", //puse id porque si no pones ninguno se buguea la tabla
                "bSearchable": false,
                "bSortable": false,
                "fnRender": function (oObj) {
                    return '<a href=\"clientes/' + 
                    oObj.aData.id + '\" class="delete_element" data-confirm="Desea eliminar el cliente?" data-method="delete" rel="nofollow"><i class="icon-remove icon-black"></i></a>';
                },
            },
	             
		],
	  	"oLanguage": {
	     	"sSearch" : "Buscar:"
	    },
	    "bProcessing": true,
		"sAjaxSource": 'update_clientes',
	});

	tClienteLicencias = $('#cliente_licencias').dataTable({
	    "fnDrawCallback": function(){
	      hoverBackgroundTable();
	    },
	    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	  	"sPaginationType": "bootstrap",
	    "iDisplayLength": 8,
	    "aLengthMenu": [[8, 10, 15, -1], [8, 10, 15, "All"]],
	     "aoColumnDefs": [
		      { "sWidth": "5%", "aTargets": [ 5,6 ] }
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

	tClienteGestiones = $('#cliente_gestiones').dataTable({
	    "fnDrawCallback": function(){
	      hoverBackgroundTable();
	    },
	    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
	  	"sPaginationType": "bootstrap",
	    "iDisplayLength": 8,
	    "bSort": false,
	    "aLengthMenu": [[8, 10, 15, -1], [8, 10, 15, "All"]],
	    "aoColumnDefs": [
	      { "sWidth": "10px", "aTargets": [ 3,4 ] },
	      { "sWidth": "200px", "aTargets": [ 2 ] }
	    ],
	    "bSortClasses": false,
	  	"oLanguage": {
	     	"sSearch" : "Buscar:"
	    }
	});



	$('#cliente_licencias tr:first').css("background-color","#EEEEEE");
	$('#cliente_gestiones tr:first').css("background-color","#EEEEEE");

	$('#filtro_principal').on('change',function(){

		var filtro_id = $(this).val();

		refresh(filtro_id);

	});

	$('#filtro_vista').on('change',function(){

		var tClientes = $('#clientes').dataTable();

		var vColumnas = [1,2,6,7];

		for (var i = 0; i < vColumnas.length; i++) {
			var column = vColumnas[i];
			var bVis = tClientes.fnSettings().aoColumns[column].bVisible;
			tClientes.fnSetColumnVis( column, bVis ? false : true );	
		}


	});

	function restringirLength(razonSocial) {

		if (razonSocial.length > 40) {

			return razonSocial.substr(0,40) + ' ...';

		} else {

			return razonSocial;
		}
	}


	function refresh(filtro_id) {
		var url = "update_clientes";
	    $.ajax({
		   	url: url,
		   	dataType: 'json',
		   	type: 'GET',
		   	data: {'pId' : filtro_id },
		   	success: function(data){
		   		console.log(data);
		   		doRefresh(data);
		   	}
	    });
	}

	function doRefresh(data){

   		tClientes.fnClearTable();
   		if (data.aaData.length)
      		tClientes.fnAddData(data.aaData);
   			tClientes.fnDraw();
	}

	function getGestion(vGestiones,pFiltro){

		if (vGestiones.length > 0) {

			var fechaUltGestion;
			var estadoUltGestion = "";

			for (var i = 0; i < vGestiones.length; i++) {

				var fechaEntera = vGestiones[i].created_at;
				var anio = fechaEntera.substr(0,4);
				var mes = fechaEntera.substr(5,2);
				mes = parseInt(mes);
				mes = mes - 1;
				mes = mes.toString();
				var dia = fechaEntera.substr(8,2);
				var hora = fechaEntera.substr(11,2);
				var minutos = fechaEntera.substr(14,2);
				var segundos = fechaEntera.substr(17,2);
				var jsDate = new Date(anio,mes,dia,hora,minutos,segundos);

				if ((i == 0) || (jsDate > fechaUltGestion)) {

					fechaUltGestion = jsDate;
					estadoUltGestion = vGestiones[i].estado.descripcion;
				}
			}

		if (pFiltro == 0) return getFormattedDate(fechaUltGestion);
		if (pFiltro == 1) return estadoUltGestion;

		} else {

			if (pFiltro == 0) return "01/01/2000";
			if (pFiltro == 1) return "SIN GESTION"; 
			
		}
	}

	function getFormattedDate(date) {

		var d  = date.getDate();
		var day = (d < 10) ? '0' + d : d;
		var m = date.getMonth() + 1;
		var month = (m < 10) ? '0' + m : m;
		var yy = date.getYear();
		var year = (yy < 1000) ? yy + 1900 : yy;
		return day + "/" + month + "/" + year; 
	}

});





