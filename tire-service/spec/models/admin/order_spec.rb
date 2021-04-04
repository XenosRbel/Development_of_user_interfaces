# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::Order, type: :model do
  subject { build(:order) }

  describe "relations" do
    it { is_expected.to have_and_belong_to_many(:services).class_name("Admin::Service") }
    it do
      is_expected.to belong_to(:master)
        .class_name("Admin::Master")
        .with_foreign_key(:admin_master_id)
    end
    it do
      is_expected.to belong_to(:discount)
        .class_name("Admin::Discount")
        .with_foreign_key(:admin_discount_id)
        .required(false)
    end
    it do
      is_expected.to belong_to(:customer)
        .class_name("Admin::Customer")
        .with_foreign_key(:admin_customer_id)
    end
  end

  describe "schema" do
    it { is_expected.to have_db_column(:admin_master_id).of_type(:integer) }
    it { is_expected.to have_db_column(:admin_discount_id).of_type(:integer) }
    it { is_expected.to have_db_column(:admin_customer_id).of_type(:integer) }
    it { is_expected.to have_db_column(:start_execution_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:end_execution_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_index(:admin_master_id) }
    it { is_expected.to have_db_index(:admin_discount_id) }
    it { is_expected.to have_db_index(:admin_customer_id) }
  end

  describe "validation" do
    %i[services].each do |attribute|
      it { is_expected.to validate_presence_of attribute }
    end
  end
end
