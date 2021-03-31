# frozen_string_literal: true

module Abilities
  class ChiefExecutiveOfficer < BaseAbility
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
  end
end
