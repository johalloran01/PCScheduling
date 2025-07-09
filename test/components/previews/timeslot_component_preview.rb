# frozen_string_literal: true

class TimeslotComponentPreview < ViewComponent::Preview
  def default
    render(TimeslotComponent.new(time_slot: TimeSlot.first))
  end
end
