$(document).ready(() => {
  $('.toggle').click((e) => {
    e.stopPropagation();
    e.preventDefault();

    $("#" + $(e.target).attr('aria-controls') ).toggleClass('is-hidden');
  })
});
