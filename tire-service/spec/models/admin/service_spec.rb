# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::Service, type: :model do
  subject { build(:service) }

  describe "relations" do
    it { is_expected.to have_and_belong_to_many(:orders).class_name("Admin::Order") }
  end

  describe "schema" do
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:float) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end
end
