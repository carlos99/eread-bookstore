$(document).ready(function() {
  if($(location).attr('pathname') === '/orders/new') {
    $("#checkout-btn").hide();
  }
});
