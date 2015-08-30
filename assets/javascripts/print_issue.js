var oldBody, issue;

redmineRestoreBody = function () {
  $('body').replaceWith(oldBody);
}

redminePrintIssue = function() {
  oldBody = $('body').detach();

  $('html').append($('<body></body>'));

  printLink.on('click', function(){window.print()});
  cancelLink.on('click', redmineRestoreBody);

  $('body').addClass('redmine-print-issue')
           .keydown(function (event) {
             ( event.keyCode == 27 ) && redmineRestoreBody.call();
           })
           .append(issue)
           .append(printLink)
           .append(cancelLink)
}

jQuery(function(){
  issue = $('div.description > div.wiki').clone();
  $('#content .description > .contextual').append(
    printLink.clone().on('click', redminePrintIssue)
  );
});
