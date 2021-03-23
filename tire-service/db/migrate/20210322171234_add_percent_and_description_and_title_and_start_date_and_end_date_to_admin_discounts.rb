class AddPercentAndDescriptionAndTitleAndStartDateAndEndDateToAdminDiscounts < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :admin_discounts, :percent, :integer, default: 0
      add_column :admin_discounts, :description, :string, null: false, default: ""
      add_column :admin_discounts, :title, :string, null: false, default: ""
      add_column :admin_discounts, :start_date_at, :datetime, null: false, default: Time.now.utc
      add_column :admin_discounts, :end_date_at, :datetime, null: false, default: Time.now.utc
    end
  end
end
