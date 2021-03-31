# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    load_and_authorize_resource
    skip_load_resource only: :index
    before_action :select_option_collection, only: %i[edit new update]

    datatable model: Order, exclude_attributes: %w[created_at
                                                   updated_at
                                                   admin_discount_id
                                                   admin_customer_id
                                                   admin_master_id]

    UPDATE_MODEL_PARAMS = %i[admin_discount_id
                             admin_customer_id
                             admin_master_id
                             end_execution_at
                             start_execution_at].freeze
    MODEL_PARAMS = UPDATE_MODEL_PARAMS + [service_ids: []]

    def create
      @order = model.create(model_params)
      respond_with @order, location: orders_path
    end

    def update
      @order.update update_model_params
      respond_with @order, location: order_path
    end

    def destroy
      @order.destroy
      redirect_to orders_path
    end

    private

    def select_option_collection
      @master_select_options = Admin::Master.all.map { |item| [item.full_name, item.id, { data: { type: item.id } }] }
      @customer_select_options = Admin::Customer.all.map { |item| [item.full_name, item.id, { data: { type: item.id } }] }
      @discount_select_options = Admin::Discount.all.map { |item| [item.title, item.id, { data: { type: item.id } }] }
    end
  end
end
