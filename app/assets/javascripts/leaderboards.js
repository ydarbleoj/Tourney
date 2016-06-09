var tournament;
tournament = function() {
  if (document.getElementById('tournament')) {
    $.ajax({
        url: "/tournament",
        cache: false,
        success: function(data){
          $("#page-views").html($(data).filter('#views'));
          $("#form-fills").html($(data).filter('#forms'));
        },
        error: function(xhr, error){
          console.debug(xhr); console.debug(error);
        }
    });
  }
};
$(document).ready(tournament);
$(document).on('page:load', tournament);
