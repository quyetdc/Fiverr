
$(document).on('turbolinks: load', () => {
  $('.toggle').on("click", (e) => {

    console.log('Toggle class clicked');

    e.stopPropagation();
    e.preventDefault();

    $("#" + $(e.target).attr('aria-controls') ).toggleClass('is-hidden');
  })
});
