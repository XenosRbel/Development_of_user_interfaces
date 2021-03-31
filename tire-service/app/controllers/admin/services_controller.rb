# frozen_string_literal: true

module Admin
  class ServicesController < ApplicationController
    load_and_authorize_resource
    skip_load_resource only: :index

    datatable model: Service, exclude_attributes: %w[created_at updated_at]

    UPDATE_MODEL_PARAMS = %i[title
                             description
                             price].freeze
    MODEL_PARAMS = UPDATE_MODEL_PARAMS

    def create
      @service = model.create(model_params)
      respond_with @service, location: services_path
    end

    def update
      @service.update update_model_params
      respond_with @service, location: service_path
    end

    def destroy
      @service.destroy
      redirect_to services_path
    end
  end
end
