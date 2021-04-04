# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::Administrator, type: :model do
  subject { build(:administrator) }

  describe "schema" do
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:role).of_type(:string) }
    it { is_expected.to have_db_column(:voucher).of_type(:string) }
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:father_name).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:reset_password_token) }
  end

  describe "validation" do
    %i[email first_name last_name father_name phone_number role].each do |attribute|
      it { is_expected.to validate_presence_of attribute }
    end
  end
end
