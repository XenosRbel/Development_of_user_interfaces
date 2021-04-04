# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::News, type: :model do
  subject { build(:news) }

  describe "schema" do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validation" do
    %i[title content].each do |attribute|
      it { is_expected.to validate_presence_of attribute }
    end
  end
end
