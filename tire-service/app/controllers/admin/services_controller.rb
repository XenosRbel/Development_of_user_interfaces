# frozen_string_literal: true

module Admin
  class ServicesController < ApplicationController
    datatable model: Service, exclude_attributes: %w[created_at updated_at]

    def index
      super
    end
  end
end
