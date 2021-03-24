# frozen_string_literal: true

module Abilities
  class Admin < Ability # rubocop:disable Metrics/ClassLength
    MODELS = [
      ::Admin::Order,
      ::Admin::Customer,
      ::Admin::Administrator,
      ::Admin::Discount,
      ::Admin::Master,
      ::Admin::Service,
      ::User
    ].freeze

    PERMISSIONS = {
      manage: MODELS
    }.freeze

    def initialize(user)
      super(user)

      define_permissions_for_users
    end

    private

    def define_permissions_for_users
      can :manage, ::User
    end
  end
end
