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
    MODEL_PARAMS = UPDATE_MODEL_PARAMS

    def index
      super
    end

    def edit; end

    def new; end

    def create
      @order = Order.new(model_params)
      redirect_to @order if @order.save
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

    def model_params
      params.require(:order).permit(*MODEL_PARAMS)
    end

    def update_model_params
      params.require(:order).permit(*UPDATE_MODEL_PARAMS)
    end

    def select_option_collection
      @master_select_options = Master.all.map { |item| [item.full_name, item.id, { data: { type: item.id } }] }
      @customer_select_options = Customer.all.map { |item| [item.full_name, item.id, { data: { type: item.id } }] }
      @discount_select_options = Discount.all.map { |item| [item.title, item.id, { data: { type: item.id } }] }
    end
  end
end
