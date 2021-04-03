# frozen_string_literal: true

module Admin
  class Order < ApplicationRecord
    has_and_belongs_to_many :services, class_name: "Admin::Service"

    belongs_to :master, foreign_key: :admin_master_id, class_name: "Admin::Master"
    belongs_to :discount, foreign_key: :admin_discount_id, class_name: "Admin::Discount"
    belongs_to :customer, foreign_key: :admin_customer_id, class_name: "Admin::Customer"

    validates_presence_of :services
    validates_datetime :end_execution_at, after: :start_execution_at, allow_blank: false

    pg_search_scope :search, against: %i[id end_execution_at start_execution_at]
  end
end
