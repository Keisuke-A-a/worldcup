$(document).ready(function() {
  var s = $('#stime').data('stime-id');
  var i = 0;
  $('tr').each(function() {
    if (s[i] == 1) {
      $(this).addClass('past');
    }
    i++
  });
});
