# frozen_string_literal: true

module Admin
  class CustomersController < ApplicationController
    datatable model: Customer

    def index
      super
    end
  end
end
