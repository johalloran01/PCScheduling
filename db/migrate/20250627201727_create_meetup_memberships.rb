class CreateMeetupMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :meetup_memberships do |t|
      t.references :meetup, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
