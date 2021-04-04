# frozen_string_literal: true

module Api
  module V1
    class NewsController < Api::ApplicationController
      def index
        data = repository

        render json: serialize_data(data)
      end

      private

      def repository
        Admin::News.all
      end

      def serialize_data(data)
        Api::V1::NewsSerializer.new(data).as_json
      end
    end
  end
end
