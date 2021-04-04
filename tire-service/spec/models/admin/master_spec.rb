# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::Master, type: :model do
  subject { build(:master) }

  describe "relations" do
    it do
      is_expected.to have_many(:orders)
        .class_name("Admin::Order")
        .with_foreign_key(:admin_master_id)
    end
  end

  describe "schema" do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:father_name).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:work_experience).of_type(:float) }
    it { is_expected.to have_db_column(:specialization).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end
end
