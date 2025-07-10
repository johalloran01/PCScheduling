# frozen_string_literal: true

class CalendarComponentPreview < ViewComponent::Preview
  def default
    week_days = TimeSlot.all.group_by { |timeslot| timeslot.day_of_week.to_sym }

    time_labels = (0..23).flat_map { |h| ["%02d:00" % h, "%02d:30" % h ]}

    render(CalendarComponent.new(week_days: week_days, time_labels: time_labels))
  end
end
