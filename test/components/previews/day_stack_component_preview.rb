# frozen_string_literal: true

class DayStackComponentPreview < ViewComponent::Preview
  def default
    timeslots = TimeSlot.all
    render(DayStackComponent.new(timeslots: timeslots))
  end
end
