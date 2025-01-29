# README

Core Idea: Focus on users providing their weekly availability, and sessions are created dynamically based on matching times.

### Backend Considerations

	Default Calendar Initialization:
    	Populate the calendar with TimeSlot records.
    	Fetch the user’s existing UserAvailability to pre-fill slots.

	API Endpoints:
    	GET /api/availability → Retrieves the user's current availability.
    	POST /api/availability → Updates availability for specific slots.

	Validation:
    	Ensure overlapping time slots are not saved.
    	Validate that time slots exist within the predefined TimeSlot table.

### UI/UX Features

	Color Coding:
    	Available Slots: Highlighted in green.
    	Unavailable Slots: Grayed out or unselected.
    	Hovered Slot: Changes to a light color to indicate interactivity.
	



### Bulk Actions:
    	A dropdown or toggle to apply availability to multiple days at once (e.g., "Apply Monday’s schedule to the entire week").

	Drag-and-Drop:
    	Users can click and drag across time slots to mark availability instead of clicking each slot individually.

	Preview Mode:
    	Before saving, show a summary of the weekly availability in a compact format (e.g., “Monday: 9–5, Tuesday: 12–3”).

	Mobile Responsiveness:
    	Adjusts the calendar to a vertical scroll format on smaller devices.

* Ruby version: 3.3.1

