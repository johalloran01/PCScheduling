class MeetupAvailabilitiesController < ApplicationController
  before_action :set_meetup

  def create
    time_slot_ids = params[:time_slot_ids] || []
    #remove previous availabilities for the user/meetup
    @meetup.meetup_availabilities.where(user: current_user).destroy_all
    #add new availabilities
    time_slot_ids.each do |ts_id|
        @meetup.meetup_availabilities.create!(user: current_user, time_slot_id: ts_id)
    end
    redirect_to @meetup, notice: "Availability Updated"
  end

  private 

  def set_meetup
    @meetup = Meetup.find(params[:meetup_id])
  end
end
