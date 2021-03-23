# frozen_string_literal: true

module Admin
  class Customer < User
    self.table_name = :admin_customers

    has_many :orders, foreign_key: :admin_customer_id, class_name: "Admin::Order"
  end
end
