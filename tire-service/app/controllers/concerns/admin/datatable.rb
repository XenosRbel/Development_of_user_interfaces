# frozen_string_literal: true

module Admin
  module Datatable
    extend ActiveSupport::Concern

    class_methods do
      attr_reader :model

      def datatable(model: nil)
        @model = model
      end
    end

    included do
      private

      def render_datatable_json
        render(json: serialized_json)
      rescue Datatable::QueryError => exception
        log_error(exception.message)
        head exception.status_code
      end

      def model_attributes
        self.class.model.column_names
      end

      def model
        self.class.model
      end

      def log_error(message)
        Rails.logger.error("#{self.class.name}: #{message}")
      end
    end
  end
end
