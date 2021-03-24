# frozen_string_literal: true

module Admin
  class DiscountsController < ApplicationController
    datatable model: Discount

    def index
      super
    end
  end
end
