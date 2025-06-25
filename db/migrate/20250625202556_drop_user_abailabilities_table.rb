class DropUserAbailabilitiesTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :user_abailabilities
  end
end