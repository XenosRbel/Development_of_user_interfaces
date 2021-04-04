# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::News, type: :model do
  subject { build(:news) }

  describe "schema" do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:string) }
  end
end
