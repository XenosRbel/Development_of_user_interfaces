class CreateAdminAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_addresses do |t|

      t.timestamps
    end
  end
end
