$(':checkbox').prop('checked', false);
const rows = $('tr tr tr tr:nth-child(1n+3)');
for ( var i = 0; i < rows.length; i++ ) {
  if ($('td:nth-child(10) input', rows[i]).length) {
    $('td:nth-child(10) input', rows[i]).prop('checked', true);
  } else {
    $('td:nth-child(9) input', rows[i]).prop('checked', true);
  }
}

// Umgewandelt mit http://bookmarklets.org/maker/ zu:

javascript:$(":checkbox").prop("checked",!1);const rows=$("tr tr tr tr:nth-child(1n+3)");for(var i=0;i<rows.length;i++)$("td:nth-child(10) input",rows[i]).length?$("td:nth-child(10) input",rows[i]).prop("checked",!0):$("td:nth-child(9) input",rows[i]).prop("checked",!0);
