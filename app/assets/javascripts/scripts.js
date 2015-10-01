$(document).on('page:change', function() {
  $('.flash, .sign-in-flash').delay(2000).fadeOut(800);
  setActiveTab();
});

function setActiveTab() {
  $('nav a').each(function() {
    if ($(this).attr('href') === window.location.pathname) {
      $(this).addClass('active');
    }
  });
}
