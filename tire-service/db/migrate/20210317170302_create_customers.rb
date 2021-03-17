class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
