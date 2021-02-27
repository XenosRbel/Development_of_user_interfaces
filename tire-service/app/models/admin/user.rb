# frozen_string_literal: true

module Admin
  class User < ApplicationRecord
    extend Enumerize

    def self.table_name_prefix
      "admin_"
    end

    self.table_name = "users"

    AVAILABLE_ROLES = %w[
      admin chief_editor managers_editor
    ].freeze

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable, :trackable

    validates :email, :last_name, :name, :father_name, :role, :sites, presence: true

    enumerize :role, in: AVAILABLE_ROLES, predicates: true

    def full_name
      "#{last_name}\t#{name}\t#{father_name}"
    end

    def role_available?
      AVAILABLE_ROLES.include?(role)
    end
  end
end
