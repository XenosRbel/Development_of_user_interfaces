# frozen_string_literal: true

module Admin
  class Service < ApplicationRecord
    self.table_name_prefix = "admin_"

    has_and_belongs_to_many :orders, class_name: "Admin::Order"
  end
end
