# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::Base
    respond_to :json
    rescue_from StandardError, with: :exception
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::ParameterMissing, with: :bad_request

    private

    def record_not_found
      head :not_found
    end

    def record_invalid
      head :unprocessable_entity
    end

    def bad_request
      head :bad_request
    end

    def exception(exception)
      Rails.logger.error(exception.full_message)
      head :internal_server_error
    end
  end
end
