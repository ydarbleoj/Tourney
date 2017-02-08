// Tournament Main Home Page
var buttonRipple = function() {
  $('.home-button-right').click(function(event) {
    $(this).parent().animate({
      boxShadow: "0 2px 3px rgba(0,0,0,0), 0 2px 3px rgba(0,0,0,0)"
    });
  });
};

$(document).ready(buttonRipple);
$(document).on('turbolinks:load', buttonRipple);

var menuToggle = function() {
  $('#toggle').click(function() {
    $(this).toggleClass('active');
    $('#overlay').toggleClass('open');
  });
};
$(document).ready(menuToggle);
$(document).on('turbolinks:load', menuToggle);
