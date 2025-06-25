class CreateUserAvailabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :user_availabilities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :time_slot, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_availabilities, [:user_id, :time_slot_id], unique: true
  end
end
