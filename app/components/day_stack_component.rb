# frozen_string_literal: true

class DayStackComponent < ViewComponent::Base
  def initialize(timeslots: [])
    @timeslots = timeslots
  end
end
