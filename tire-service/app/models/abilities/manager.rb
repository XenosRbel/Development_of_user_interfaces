# frozen_string_literal: true

module Abilities
  class Manager < BaseAbility
    MODELS = [
      ::Admin::Order,
      ::Admin::Customer,
      ::Admin::Administrator,
      ::Admin::Discount,
      ::Admin::Master,
      ::Admin::Service
    ].freeze

    PERMISSIONS = {
      edit: [::Admin::Order],
      read: [::Admin::Order,
             ::Admin::Customer,
             ::Admin::Administrator,
             ::Admin::Discount,
             ::Admin::Master,
             ::Admin::Service,
             ::Admin::News],
      create: [::Admin::Order, ::Admin::Customer]
    }.freeze
  end
end
