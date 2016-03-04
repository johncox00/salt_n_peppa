class UsersController < ApplicationController
  def index
    @users = User.includes(:workouts).active.sorted
  end

  def show
    @user = User.includes(:workouts).find(params[:id])
  end
end
