class CreateJoinTableAdminOrderAdminService < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      create_table :admin_orders_services, id: false do |t|
        t.belongs_to :order, index: true
        t.belongs_to :service, index: true
      end
    end
  end
end
