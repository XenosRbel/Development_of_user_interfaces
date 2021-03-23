class AddIdNumberAndNumberAndSeriesToAdminPassports < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :admin_passports, :id_number, :string, null: false, default: ""
      add_column :admin_passports, :number, :integer, null: false, default: 0
      add_column :admin_passports, :series, :char, limit: 2, null: false, default: ''

      add_index :admin_passports, :id_number, unique: true
    end
  end
end
