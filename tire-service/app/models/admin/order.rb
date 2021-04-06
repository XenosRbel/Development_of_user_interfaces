# frozen_string_literal: true

module Admin
  class Order < ApplicationRecord
    has_and_belongs_to_many :services, class_name: "Admin::Service"

    belongs_to :master, foreign_key: :admin_master_id, class_name: "Admin::Master"
    belongs_to :discount, foreign_key: :admin_discount_id, required: false, class_name: "Admin::Discount"
    belongs_to :customer, foreign_key: :admin_customer_id, class_name: "Admin::Customer"

    validates_presence_of :services
    validates_datetime :end_execution_at, after: :start_execution_at, allow_blank: false

    pg_search_scope :search, against: %i[id end_execution_at start_execution_at]

    scope :find_not_finished, lambda {
      where(
        arel_table[:start_execution_at]
          .lt(arel_table[:end_execution_at])
          .and(arel_table[:end_execution_at]
            .gt(Arel::Nodes::NamedFunction.new("now", [])))
      )
    }

    def total_sum
      services.sum(:price)
    end

    def discount_amount
      percent = discount.nil? ? 0 : discount.percent
      (total_sum * percent / 100).round(2)
    end

    def total_sum_with_discount
      percent = discount.nil? ? 0 : discount.percent
      (total_sum - (total_sum * percent / 100)).round(2)
    end
  end
end
