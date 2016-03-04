json.array!(@workouts) do |workout|
  json.extract! workout, :id, :reps, :user_id, :finished_at
  json.url workout_url(workout, format: :json)
end
