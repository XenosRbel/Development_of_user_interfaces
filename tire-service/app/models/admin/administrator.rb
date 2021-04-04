# frozen_string_literal: true

module Admin
  class Administrator < User
    extend Enumerize
    include VoucherHelper

    self.table_name = :admin_administrators

    AVAILABLE_ROLES = %w[
      chief_executive_officer chief_editor manager
    ].freeze

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    validates :email, :first_name, :last_name, :father_name, :phone_number, :role, presence: true
    enumerize :role, in: AVAILABLE_ROLES, predicates: true

    before_validation :create_voucher

    pg_search_scope :search, against: %i[id
                                         email
                                         first_name
                                         last_name
                                         father_name
                                         phone_number
                                         role]

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
