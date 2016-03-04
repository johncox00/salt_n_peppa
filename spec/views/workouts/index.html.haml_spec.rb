require 'rails_helper'

RSpec.describe "workouts/index", :type => :view do
  before(:each) do
    assign(:workouts, [
      Workout.create!(
        :reps => 1,
        :user => nil
      ),
      Workout.create!(
        :reps => 1,
        :user => nil
      )
    ])
  end

  it "renders a list of workouts" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
