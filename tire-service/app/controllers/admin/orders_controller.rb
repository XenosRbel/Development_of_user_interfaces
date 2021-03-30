# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    datatable model: Order, exclude_attributes: %w[created_at updated_at]

    def index
      super
    end
  end
end
