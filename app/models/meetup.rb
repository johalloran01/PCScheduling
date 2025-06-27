class Meetup < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :meetup_participants, dependent: :destroy
  has_many :participants, through: :meetup_participants, source: :user
  has_many :meetup_availabilities, dependent: :destroy
end
