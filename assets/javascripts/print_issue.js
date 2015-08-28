jQuery(document).ready(function(){
  var printLink = $('<a href="#" class="icon icon-print">Print</a>').on('click', function(){window.print()});
  $('#content .description > .contextual').append(printLink);
});
