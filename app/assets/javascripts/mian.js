$(document).ready(function() {
  function setHeight() {
    windowHeight = $(window).innerHeight();
    $('.main-banner').css('min-height', windowHeight);
  };
  setHeight();

  $(window).resize(function() {
    setHeight();
  });
});
