class CreateAdminPassports < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_passports do |t|

      t.timestamps
    end
  end
end
