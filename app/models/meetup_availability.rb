class MeetupAvailability < ApplicationRecord
  belongs_to :meetup
  belongs_to :user
  belongs_to :time_slot
end
