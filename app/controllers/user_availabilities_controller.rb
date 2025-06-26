class UserAvailabilitiesController < ApplicationController
  def index
    # Get all time slots organized by day of week
    @time_slots_by_day = TimeSlot.all.order(:day_of_week, :start_time).group_by(&:day_of_week)
    # Get current user's availabilities
    @user_availabilities = current_user.user_availabilities.includes(:time_slot)
    # Create a hash of user's available time slot IDs for easy loookup.
    @user_available_slot_ids = @user_availabilities.map(&:time_slot_id).to_set

  end

  def create
    # Get the time slot ID from the form submission
    time_slot_ids = params[:time_slot_ids] || []

    # start a transaction to ensure all-or-nothing creation
    ActiveRecord::Base.transaction do
      # Clear the existing availabilities for this user
      current_user.user_availabilities.destroy_all
      #create new availabilities for each selected time slot.
      time_slots_ids.each do |time_slot_id|
        current_user.user_availabilities.create!(time_slot_id: time_slot_id)
      end
    end

    # Success response
    redirect_to_user_availabilities_path, notice: 'Availability updated successfully!'

  rescue ActiveRecord::RecordInvalid => e 
    redirect_to_user_availabilities_path, alert: 'Failed to update availability. Please try again.'
  end

  def update
  end
end
