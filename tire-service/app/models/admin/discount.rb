# frozen_string_literal: true

module Admin
  class Discount < ApplicationRecord
    has_many :orders, foreign_key: :admin_discount_id, class_name: "Admin::Order"

    validates :title, :description, presence: true
    validates_datetime :end_date_at, after: :start_date_at, allow_blank: false
  end
end
