class CreateAdminDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_discounts do |t|

      t.timestamps
    end
  end
end
