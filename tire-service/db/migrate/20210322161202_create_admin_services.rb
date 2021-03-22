class CreateAdminServices < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_services do |t|

      t.timestamps
    end
  end
end
