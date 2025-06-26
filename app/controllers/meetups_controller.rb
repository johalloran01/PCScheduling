class MeetupsController < ApplicationController
    before_action : set_meetup, only: [:show, :destroy]

    def new 
        @meetup = Meetup.new
    end

    def create 
        @meetup = Meetup.new(meetup_params)
        @meetup.creator = current_user
        if @meetup.save
            @meetup.meetup_participants.create!(user: current_user, status: "joined")
            redirect_to @meetup, notice: "Meetup Created!"
        else
            render :new
        end
    end

    def show 
        @participants = @meetup.participants
        @availabilities = @meetup.meetup_availabilities.includes(:user, :time_slot)
    end

    def destroy
        if @meetup.creator == current_user
            @meetup.destroy
            redirect_to meetups_path, notice: "Meetup Deleted"
        else
            redirect_to @meetup, alert: "Only the creator can delete this meetup."
        end
    end

    private

    def set_meetup
        @meetup = Meetup.find(params[:id])
    end

    def meetup_params
        params.require(:meetup).permit(:name, :description, :image_url)
    end
end
