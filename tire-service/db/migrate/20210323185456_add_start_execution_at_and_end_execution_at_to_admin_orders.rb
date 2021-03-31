class AddStartExecutionAtAndEndExecutionAtToAdminOrders < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :admin_orders, :start_execution_at, :datetime, null: false
      add_column :admin_orders, :end_execution_at, :datetime, null: false
    end
  end
end
