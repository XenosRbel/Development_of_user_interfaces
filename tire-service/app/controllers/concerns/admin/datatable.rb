# frozen_string_literal: true

module Admin
  module Datatable
    extend ActiveSupport::Concern

    class_methods do
      attr_reader :model, :exclude_attributes

      def datatable(model: nil, exclude_attributes: [])
        @model = model
        @exclude_attributes = exclude_attributes
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
        self.class.model.column_names - self.class.exclude_attributes
      end

      def model
        self.class.model
      end

      def log_error(message)
        Rails.logger.error("#{self.class.name}: #{message}")
      end

      def respond_with_search
        items = model.search(search_params)
        return model.all.order(id: :ASC) unless items.present?

        items
      end

      def search_params
        params.fetch(:search, "")
      end

      def buld_like_query
        where("title LIKE ?", "%#{search}%")
      end
    end
  end
end
