# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  self.table_name = "users"

  AVAILABLE_ROLES = %w[
    admin chief_editor offices_editor
  ].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :fist_name, :last_name, :father_name, :phone_number, :role, :sites, presence: true
  enumerize :role, in: AVAILABLE_ROLES, predicates: true

  class << self
    def current=(user)
      RequestStore.store[:current_user] = user
    end

    def current
      RequestStore.store[:current_user]
    end
  end

  def role_available?
    AVAILABLE_ROLES.include?(role)
  end
end
