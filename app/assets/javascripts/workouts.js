ready = function(){
  $("#rep_incr").on("touchstart", function(){
    current_count = $("#rep_incr").data("reps");
    current_count++;
    $("#rep_incr").data("reps", current_count);
    $("#rep_count").text(current_count);
  });

  $("#rep_decr").on("touchstart", function(){
    current_count = $("#rep_incr").data("reps");
    if(current_count > 0){
      current_count--;
    }
    $("#rep_incr").data("reps", current_count);
    $("#rep_count").text(current_count);
  });

  $('#workout_submit').click(function(){
    current_count = $("#rep_incr").data("reps");
    current_workout = $("#rep_incr").data("workout");
    current_time = new Date();
    $.ajax({
      url: "/workouts/"+current_workout,
      data: {workout: {reps: current_count, finished_at: current_time}},
      method: 'PUT',
      dataType: 'json'
    }).done(function() {
      document.location.href = "/workouts/"+current_workout;
    });
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
