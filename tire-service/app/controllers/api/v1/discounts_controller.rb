# frozen_string_literal: true

module Api
  module V1
    class DiscountsController < Api::ApplicationController
      def index
        data = repository

        render json: serialize_data(data)
      end

      private

      def repository
        Admin::Discount.all
      end

      def serialize_data(data)
        Api::V1::DiscountsSerializer.new(data).as_json
      end
    end
  end
end
