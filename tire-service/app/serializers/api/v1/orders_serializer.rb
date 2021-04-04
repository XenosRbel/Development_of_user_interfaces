# frozen_string_literal: true

module Api
  module V1
    class OrdersSerializer < BaseSerializer
      set_type :order

      set_key_transform :camel_lower

      attributes :id,
                 :end_execution_at,
                 :start_execution_at

      attribute :discount do |object, _params|
        discounts = Admin::Discount.where(id: object.admin_discount_id)
        DiscountsSerializer.new(discounts).as_json
      end

      attribute :master do |object, _params|
        masters = Admin::Master.where(id: object.admin_master_id)
        MastersSerializer.new(masters).as_json
      end

      attribute :customer do |object, _params|
        masters = Admin::Customer.where(id: object.admin_customer_id)
        CustomersSerializer.new(masters).as_json
      end
    end
  end
end
