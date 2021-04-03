# frozen_string_literal: true

module Admin
  class Customer < User
    self.table_name = :admin_customers

    has_many :orders, foreign_key: :admin_customer_id, class_name: "Admin::Order"

    pg_search_scope :search, against: %i[id
                                         first_name
                                         last_name
                                         father_name
                                         phone_number]
  end
end
