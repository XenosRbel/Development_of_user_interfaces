# frozen_string_literal: true

module Admin
  class ServicesController < ApplicationController
    load_and_authorize_resource
    skip_load_resource only: :index

    datatable model: Service, exclude_attributes: %w[created_at updated_at]

    def index
      super
    end
  end
end
