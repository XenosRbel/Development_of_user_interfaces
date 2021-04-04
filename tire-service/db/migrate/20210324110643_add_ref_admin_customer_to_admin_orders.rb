class AddRefAdminCustomerToAdminOrders < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_reference :admin_orders, :admin_customer, foreign_key: true
    end
  end
end
