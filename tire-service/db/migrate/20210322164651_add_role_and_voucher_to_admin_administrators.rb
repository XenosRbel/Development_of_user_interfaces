class AddRoleAndVoucherToAdminAdministrators < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :admin_administrators, :role, :string, null: false, default: ""
      add_column :admin_administrators, :voucher, :string, default: ""
    end
  end
end
