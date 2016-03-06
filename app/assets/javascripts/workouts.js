ready = function(){
  $("#rep_incr").click(function(){
    current_count = $("#rep_incr").data("reps");
    current_workout = $("#rep_incr").data("workout");
    current_count++;
    $("#rep_incr").data("reps", current_count);
    $("#rep_count").text(current_count);
    // $.ajax({
    //   url: "/workouts/"+current_workout,
    //   data: {workout: {reps: current_count}},
    //   method: 'PUT',
    //   dataType: 'json'
    // }).done(function() {
    //   // nothing here
    // });
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
