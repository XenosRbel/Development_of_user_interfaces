class AddVoucherToUsers < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :users, :voucher, :string, default: "", null: false
    end
  end
end
