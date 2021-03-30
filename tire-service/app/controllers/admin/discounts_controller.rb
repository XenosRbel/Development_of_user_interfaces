# frozen_string_literal: true

module Admin
  class DiscountsController < ApplicationController
    datatable model: Discount, exclude_attributes: %w[created_at updated_at]

    def index
      super
    end
  end
end
