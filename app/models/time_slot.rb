class TimeSlot < ApplicationRecord
	enum :day_of_week, sunday:0, monday: 1, tuesday:2, wednesday:3, thursday:4, friday:5, saturday:6

	has_many :user_availabilities
	has_many :users, through: :user_availabilities
end