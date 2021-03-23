class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      create_table :users do |t|
        t.string :type
        t.timestamps
      end
    end
  end
end
