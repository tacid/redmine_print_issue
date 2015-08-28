jQuery(document).ready(function(){
  var printLink = $('<a href="#" class="icon icon-copy">Print as Story</a>').on('click', function(){window.print()});
  $('#content .description > .contextual').append(printLink);
});
