# frozen_string_literal: true

module Admin
  class Service < ApplicationRecord
    has_and_belongs_to_many :orders, class_name: "Admin::Order"

    pg_search_scope :search, against: %i[id
                                         description
                                         title
                                         price]
  end
end
