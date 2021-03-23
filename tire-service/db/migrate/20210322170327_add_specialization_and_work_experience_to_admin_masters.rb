class AddSpecializationAndWorkExperienceToAdminMasters < ActiveRecord::Migration[5.2]
  def change
    safety_assured do
      add_column :admin_masters, :specialization, :string, default: "", null: false
      add_column :admin_masters, :work_experience, :float, default: 0, null: false
    end
  end
end
