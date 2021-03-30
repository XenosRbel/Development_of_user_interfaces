# frozen_string_literal: true

module Admin
  class CustomersController < ApplicationController
    datatable model: Customer, exclude_attributes: %w[created_at updated_at]

    def index
      super
    end
  end
end
