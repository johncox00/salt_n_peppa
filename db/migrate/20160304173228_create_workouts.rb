class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.integer :reps
      t.references :user, foreign_key: true
      t.datetime :finished_at

      t.timestamps
    end
  end
end
