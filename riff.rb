class User
  #fields
  # rails g model User name email:unique

  # relationships
  has_many :user_availabilities
  has_many :availabilities, through: :user_availabilities
  has_many :session_members
end

class UserAvailaibility #private
  # relationships
  belongs_to :user
  belongs_to :time_slot
end



class TimeSlot
  # fields
  t.integer :day_of_week
    #Date.today.wday potential API for displaying date information
  enum :day_of_week, %w[sunday monday tuesday wednesday thursday friday saturday].index_by(&:itself)
  t.time :start_time
  t.time :end_time
  # relationships
  has_many :user_availabilities
  has_many :sessions
end
1 = TimeSlot.create!(day_of_week: 0, start_time: "00:00:00", end_time: "00:29:59")
2 = TimeSlot.create!(day_of_week: 0, start_time: "00:30:00", end_time: "00:59:59")
3 = TimeSlot.create!(day_of_week: 0, start_time: "01:00:00", end_time: "01:30:59")
# ...
50 = TimeSlot.create!(day_of_week: 1, start_time: "01:00:00", end_time: "01:30:59")


# Getting your list of timeslots to render
TimeSlot.all.order(day_of_week: :asc, start_time: :asc).group_by{|x| x.day_of_week }

{
  0 => [
    # Timeslot 1
    # Timeslot 2
  ],
  1 => [
    # Timeslot 50
  ]
}

# In the view
user_local_times = []
Time.zone = Current.user.time_zone
Time.use_zone(current_user.timezone) do
  time_slots.start_time.in_time_zone(current_user.timezone)
end

# In the form
time_slots.each do |time_slot|
  f.check_box :time_slots, values: timeslot.id
end

0.upto 7 do |day|

end
#for each day_of_week ->
# populate with 30 minute increments. (48) for each day.
# ...
# 7 days * 48 30 minute increments



# Backend considerations
# Prefer time slots, so input is standardized & requires minimal validation

# Matching algorithm
# ID overlapping UserAvailaibility records for the same TimeSlot to propose sessions

user_1_availabilities = [
  12PM UTC,
  1PM UTC
]

user_2_availabilities = [
  1PM UTC
]

overlap = UserAvailaibility.where(user_id: [1,2])
