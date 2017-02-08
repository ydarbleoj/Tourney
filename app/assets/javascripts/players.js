var pickaDate;
pickaDate = function(){
    console.log("HERHEE");
  $('.date-picker').fdatepicker({
    format: 'hh:ii',
    disableDblClickSelection: true,
    language: 'vi',
    pickTime: true
    // changeMonth: true,
    // changeYear: true,
    // pickTime: true,
    // showButtonPanel: true,
    // yearRange: "-100:+0",
    // dateFormat: 'yy-m-d',
    // onSelect: function(dateText, inst) {
    //   $(this).datepicker('setDate', new Date(dateText));
    // }
  });

};
$(document).ready(pickaDate);
$(document).on('turbolinks:load', pickaDate);
// .fdatepicker({
//   });
