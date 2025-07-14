# frozen_string_literal: true

class DayStackComponent < ViewComponent::Base
  def initialize(timeslots: [], time_labels:, day:)
    @timeslots = timeslots
    @time_labels = time_labels
    @day = day
  end
end
