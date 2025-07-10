# frozen_string_literal: true

class TimeslotComponentPreview < ViewComponent::Preview
  def default
    render(TimeslotComponent.new(timeslot: TimeSlot.first))
  end
end
