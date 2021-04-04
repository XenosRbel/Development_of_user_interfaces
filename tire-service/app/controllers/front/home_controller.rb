# frozen_string_literal: true

module Front
  class HomeController < ApplicationController
    layout "front"

    before_action :home_params, only: %i[index]

    def order_info
      @orders = search_by_params(params[:search])

      respond_to do |format|
        format.html { render partial: "order_info" }
        format.js { render json: @orders }
      end
    end

    private

    PHONE_NUMBER_PATTERN = /^\+375(17|29|33|44)\d{3}\d{2}\d{2}$/.freeze

    def search_by_params(value)
      by_id = search_by_order_id(value)
      return by_id if by_id.present?

      by_phone = search_by_phone_number(value)
      return by_phone if by_phone.present?

      []
    end

    def search_by_order_id(value)
      Admin::Order.where(id: value)
    end

    def search_by_phone_number(value)
      return Admin::Customer.where(phone_number: value).take.orders if valid_phone_number?(value)
    end

    def home_params
      @news = Admin::News.all.order(updated_at: :ASC)
    end

    def valid_phone_number?(phone_number)
      (phone_number =~ PHONE_NUMBER_PATTERN).present?
    end
  end
end
