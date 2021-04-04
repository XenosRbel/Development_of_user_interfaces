# frozen_string_literal: true

module Admin
  class Master < User
    self.table_name = :admin_masters

    has_many :orders, foreign_key: :admin_master_id, class_name: "Admin::Order"

    pg_search_scope :search, against: %i[id
                                         first_name
                                         last_name
                                         father_name
                                         phone_number
                                         work_experience
                                         specialization]
  end
end
