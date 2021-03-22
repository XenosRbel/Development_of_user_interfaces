class CreateAdminOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_offers do |t|

      t.timestamps
    end
  end
end
