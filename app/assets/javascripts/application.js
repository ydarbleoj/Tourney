// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(document).foundation();
var scrollEffect = function() {
  var trgt = $('.scroll-trgt').offset().top - 130;
  var $w = $(window).scroll(function (){
    if ($w.scrollTop() > trgt){
      $('.scroll-effect').css({"box-shadow":"0 4px 6px -4px #222"})
    } else {
      $('.scroll-effect').css({"box-shadow":"0 0px 0px 0px #222"})
    }
 })
};
$(document).ready(scrollEffect);
$(document).on('turbolinks:load', scrollEffect);
