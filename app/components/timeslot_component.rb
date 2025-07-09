# frozen_string_literal: true

class TimeslotComponent < ViewComponent::Base
  def initialize(time_slot:)
    @time_slot = time_slot
  end
end
