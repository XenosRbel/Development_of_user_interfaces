class AddRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :users, :role, :string, null: false
    end
  end
end
