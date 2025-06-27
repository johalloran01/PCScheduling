class MeetupParticipantsController < ApplicationController
  before_action :set_meetup

  def create
    user = User.find_by(email: params[:email])
    if user && !@meetup.participants.include?(user)
        @meetup.participants.create!(user: user, status: "invited")
        redirect_to @meetup, notice: "User Invited!"
    else
        redirect_to @meetup, alert: "User not found or already invited."
    end
  end

  def update
    participant = @meetup.meetup_participants.find_by(user: current_user)
    if participant && ["joined", "declined"].include?(params[:status])
        participant.update!(status: params[:status])
        redirect_to @meetup, notice: "Status updated."
    else
        redirect_to @meetup, alert: "Invalid update."
    end
  end

  def destroy
    participant = @meetup.meetup_participants.find_by(user: current_user)
    if participant
        participant.destroy
        redirect_to meetups_path, notice: "You left the meetup."
    else
        redirect_to @meetup, alert: "Not a participant."
    end
  end

  private 

  def set_meetup
    @meetup = Meetup.find(params[:meetup_id])
  end
end
