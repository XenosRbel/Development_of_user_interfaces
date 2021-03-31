# frozen_string_literal: true

module Admin
  class DiscountsController < ApplicationController
    load_and_authorize_resource
    skip_load_resource only: :index

    datatable model: Discount, exclude_attributes: %w[created_at updated_at]

    UPDATE_MODEL_PARAMS = %i[title
                             description
                             end_date_at
                             start_date_at
                             percent].freeze
    MODEL_PARAMS = UPDATE_MODEL_PARAMS

    def update
      @discount.update update_model_params
      respond_with @discount, location: discount_path
    end

    def destroy
      @discount.destroy
      redirect_to discounts_path
    end
  end
end
