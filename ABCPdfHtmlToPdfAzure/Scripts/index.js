$(function () {
  $('#generateBtn').click(function () {
    var url = '/Home/CreateHtmlPdf?url=' + $('#url').val();

    var win = window.open(url, '_blank');
    win.focus();
  });
});