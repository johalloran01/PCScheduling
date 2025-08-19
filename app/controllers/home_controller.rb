class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    @user_meetups = current_user.meetups.includes(:creator, :participants)
    @created_meetups = current_user.created_meetups.includes(:participants)
  end
end
