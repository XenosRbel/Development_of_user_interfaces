# frozen_string_literal: true

module Admin
  class Master < User
    self.table_name = :admin_masters

    has_many :orders, foreign_key: :admin_master_id, class_name: "Admin::Order"
  end
end
