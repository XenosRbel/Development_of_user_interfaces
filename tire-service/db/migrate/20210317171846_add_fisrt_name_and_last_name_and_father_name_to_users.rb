class AddFisrtNameAndLastNameAndFatherNameToUsers < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :users, :first_name, :string, null: false
      add_column :users, :last_name, :string,  null: false
      add_column :users, :father_name, :string,  null: false
    end
  end
end
