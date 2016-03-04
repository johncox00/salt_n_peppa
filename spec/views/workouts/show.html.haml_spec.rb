require 'rails_helper'

RSpec.describe "workouts/show", :type => :view do
  before(:each) do
    @workout = assign(:workout, Workout.create!(
      :reps => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
