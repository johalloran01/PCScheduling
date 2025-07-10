# frozen_string_literal: true

class TimeslotComponent < ViewComponent::Base
  def initialize(timeslot:)
    @timeslot = timeslot
  end
end
