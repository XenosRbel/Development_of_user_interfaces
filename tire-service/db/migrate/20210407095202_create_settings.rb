class CreateSettings < ActiveRecord::Migration[5.2]
  def up
    safety_assured do
      create_table :settings do |t|
        t.string  :var,        null: false
        t.text    :value,      null: true
        t.timestamps
      end
  
      add_index :settings, %i(var), unique: true
    end
  end

  def down
    safety_assured do
      drop_table :settings
    end
  end
end
