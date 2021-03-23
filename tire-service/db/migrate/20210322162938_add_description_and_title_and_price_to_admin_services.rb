class AddDescriptionAndTitleAndPriceToAdminServices < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :admin_services, :description, :string, null: false, default: ""
      add_column :admin_services, :title, :string, null: false, default: ""
      add_column :admin_services, :price, :float, null: false, default: 0
    end
  end
end
