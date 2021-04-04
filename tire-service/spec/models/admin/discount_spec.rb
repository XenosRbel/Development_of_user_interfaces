# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::Discount, type: :model do
  subject { build(:discount) }

  describe "relations" do
    it do
      is_expected.to have_many(:orders)
        .class_name("Admin::Order")
        .with_foreign_key(:admin_discount_id)
    end
  end

  describe "schema" do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:start_date_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:end_date_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validation" do
    %i[title description].each do |attribute|
      it { is_expected.to validate_presence_of attribute }
    end
  end
end
