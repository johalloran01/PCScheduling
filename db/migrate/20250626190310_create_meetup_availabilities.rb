class CreateMeetupAvailabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :meetup_availabilities do |t|
      t.references :meetup, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :time_slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
