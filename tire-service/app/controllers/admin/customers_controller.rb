# frozen_string_literal: true

module Admin
  class CustomersController < ApplicationController
    load_and_authorize_resource
    skip_load_resource only: :index

    UPDATE_MODEL_PARAMS = %i[last_name
                             first_name
                             father_name
                             phone_number].freeze
    MODEL_PARAMS = UPDATE_MODEL_PARAMS

    datatable model: Customer, exclude_attributes: %w[created_at updated_at]

    def create
      @customer = @model.new(model_params)
      redirect_to @customer if @customer.save
    end

    def update
      @customer.update update_model_params
      respond_with @order, location: customer_path
    end

    def destroy
      @customer.destroy
      redirect_to customers_path
    end
  end
end
