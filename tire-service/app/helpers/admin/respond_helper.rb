# frozen_string_literal: true

module Admin
  module RespondHelper
    include ::RespondHelper

    def respond_html_and_datatable_json_for(model, options = {})
      template = options.delete :template
      respond_to do |format|
        format.html { render template if template.present? }
        format.json { render json: datatable_for(model, options) }
      end
    end

    def respond_json_with_errors(model)
      render json: model.errors.full_messages, status: :unprocessable_entity
    end
  end
end
