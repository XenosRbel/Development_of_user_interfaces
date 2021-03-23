class DropUsers < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      drop_table :users
    end
  end
end
