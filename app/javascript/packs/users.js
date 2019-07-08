$(document).ready(function() {
  $('.toggle').click(function(){
    $("#" + $(event.target).attr('aria-controls') ).toggleClass('is-hidden');
  })
});
