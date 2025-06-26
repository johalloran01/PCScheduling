class CreateMeetups < ActiveRecord::Migration[8.0]
  def change
    create_table :meetups do |t|
      t.string :name
      t.text :description
      t.integer :creator_id
      t.string :image_url

      t.timestamps
    end
  end
end
