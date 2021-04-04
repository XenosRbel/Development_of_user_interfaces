class CreateAdminCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_customers, inherits: :users do |t|

      t.timestamps
    end
  end
end
