class AddLastNameAndFirstNameAndFatherNameAndPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :users, :last_name, :string, null: false, default: ""
      add_column :users, :first_name, :string, null: false, default: ""
      add_column :users, :father_name, :string, null: false, default: ""
      add_column :users, :phone_number, :string, null: false,default: ""

      add_index :users, :phone_number, unique: true
    end
  end
end
