var oldBody, issue;

redmineRestoreBody = function () {
  $('body').replaceWith(oldBody);
}

redminePrintIssue = function() {
  oldBody = $('body').detach();

  $('html').append($('<body></body>'));

  printLink.on('click', function(){window.print()});
  cancelLink.on('click', redmineRestoreBody);

  $tmpl=$('#print-tmpl').html();

  $('body').addClass('redmine-print-issue')
           .keydown(function (event) {
             ( event.keyCode == 27 ) && redmineRestoreBody.call();
           })
           .append($tmpl)
           .append(printLink)
           .append(cancelLink);
  $('body').find('[data-content="issue-description"]').append(issue);
}

jQuery(function(){
  issue = $('div.description > div.wiki').html();
  $('#content .description > .contextual').append(
    printLink.clone().on('click', redminePrintIssue)
  );
});
