$(document).ready(function() {

  tVstContactos = $('#vstContactos').dataTable({
    "fnDrawCallback": function(){
      hoverBackgroundTable();
    },
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "iDisplayLength": 30,
    "aLengthMenu": [[10, 15, 30, -1], [10, 15, 30, "All"]],
    "bSortClasses": false,
      "aoColumnDefs": [
        { "sWidth": "5%", "aTargets": [ 4 ] }
      ],
    "oLanguage": {
      "sSearch" : "Buscar:"
    }
  });
});