class AddTotalsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_reps, :integer, default: 0
    add_column :users, :total_workouts, :integer, default: 0
  end
end
