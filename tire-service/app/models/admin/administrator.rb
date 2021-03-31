# frozen_string_literal: true

module Admin
  class Administrator < User
    extend Enumerize
    include VoucherHelper

    self.table_name = :admin_administrators

    AVAILABLE_ROLES = %w[
      admin chief_editor manager chief_executive_officer
    ].freeze

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    validates :email, :first_name, :last_name, :father_name, :phone_number, :role, :voucher, presence: true
    enumerize :role, in: AVAILABLE_ROLES, predicates: true

    before_validation :create_voucher

    class << self
      def current=(user)
        RequestStore.store[:current_administrator] = user
      end

      def current
        RequestStore.store[:current_administrator]
      end
    end

    def role_available?
      AVAILABLE_ROLES.include?(role)
    end
  end
end
