class Workout < ApplicationRecord
  belongs_to :user
  after_save :maybe_update_totals

  def maybe_update_totals
    unless finished_at.blank?
      user.total_reps ||= 0
      user.total_workouts ||= 0
      user.total_reps += reps
      user.total_workouts += 1
      user.save
    end
  end
end
