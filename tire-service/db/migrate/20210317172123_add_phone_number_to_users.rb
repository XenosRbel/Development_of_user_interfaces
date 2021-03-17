class AddPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :users, :phone_number, :string, null: false
    end
  end
end
