# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    datatable model: Order

    def index
      super
    end
  end
end
