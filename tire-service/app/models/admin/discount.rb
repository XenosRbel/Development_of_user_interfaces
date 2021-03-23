# frozen_string_literal: true

module Admin
  class Discount < ApplicationRecord
    has_many :orders, foreign_key: :admin_discount_id, class_name: "Admin::Order"
  end
end
