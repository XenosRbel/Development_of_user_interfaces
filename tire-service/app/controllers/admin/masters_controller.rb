# frozen_string_literal: true

module Admin
  class MastersController < ApplicationController
    load_and_authorize_resource
    skip_load_resource only: :index

    datatable model: Master, exclude_attributes: %w[created_at updated_at]

    UPDATE_MODEL_PARAMS = %i[last_name
                             first_name
                             father_name
                             phone_number
                             specialization
                             work_experience].freeze
    MODEL_PARAMS = UPDATE_MODEL_PARAMS

    def create
      @master = model.create(model_params)
      respond_with @master, location: masters_path
    end

    def update
      @master.update(model_params)
      respond_with @master, location: master_path
    end

    def destroy
      @master.destroy
      redirect_to masters_path
    end
  end
end
