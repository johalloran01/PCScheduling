# frozen_string_literal: true

#week_days: a hash where the days act as keys, to display corresponding daystacks 
class CalendarComponent < ViewComponent::Base
	def initialize(week_days:, time_labels:)
		@week_days = week_days
		@time_labels = time_labels
	end

attr_reader :week_days, :time_labels

end
