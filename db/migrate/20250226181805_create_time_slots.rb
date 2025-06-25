class CreateTimeSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :time_slots do |t|
      t.integer :day_of_week
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
    add_index(:time_slots, [:day_of_week, :start_time], unique: true)
  end
end
