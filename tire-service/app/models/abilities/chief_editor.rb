# frozen_string_literal: true

module Abilities
  class ChiefEditor < BaseAbility
    MODELS = [
      ::Admin::Order,
      ::Admin::Customer,
      ::Admin::Administrator,
      ::Admin::Discount,
      ::Admin::Master,
      ::Admin::Service,
      ::Admin::News
    ].freeze

    PERMISSIONS = {
      read: [
        ::Admin::Administrator
      ],
      manage: [
        ::Admin::Order,
        ::Admin::Customer,
        ::Admin::Discount,
        ::Admin::Master,
        ::Admin::Service,
        ::Admin::News
      ]
    }.freeze
  end
end
