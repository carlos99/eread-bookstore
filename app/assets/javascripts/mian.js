$(document).ready(function() {
  function setHeight() {
    windowHeight = $(window).innerHeight();
    $('.fixed-content').css('min-height', windowHeight);
  };
  setHeight();

  $(window).resize(function() {
    setHeight();
  });
});
