require 'rails_helper'

RSpec.describe "workouts/edit", :type => :view do
  before(:each) do
    @workout = assign(:workout, Workout.create!(
      :reps => 1,
      :user => nil
    ))
  end

  it "renders the edit workout form" do
    render

    assert_select "form[action=?][method=?]", workout_path(@workout), "post" do

      assert_select "input#workout_reps[name=?]", "workout[reps]"

      assert_select "input#workout_user_id[name=?]", "workout[user_id]"
    end
  end
end
