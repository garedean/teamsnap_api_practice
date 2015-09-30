$(document).on('page:change', function() {
  $('.flash').delay(1500).fadeOut(800);
  setActiveTab();
});

function setActiveTab() {
  $('nav a').each(function() {
    if ($(this).attr('href') === window.location.pathname) {
      $(this).addClass('active');
    }
  });
}
