# frozen_string_literal: true

module Admin
  module OrdersHelper
    def discount_title(order)
      order.discount.present? ? order.discount.title : ""
    end
  end
end
