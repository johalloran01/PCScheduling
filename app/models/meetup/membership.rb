class Meetup::Membership < ApplicationRecord
  belongs_to :meetup
  belongs_to :user

  enum :role, %i[ owner participant ].index_by(&:itself)

end


