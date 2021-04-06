# frozen_string_literal: true

module Cdn
  class OrdersController < ApplicationController
    include ::RespondHelper
    include ::ApplicationHelper

    def index
      @orders = Admin::Order.where(id: params[:orders_ids])

      respond_html_json_and_pdf_for(@orders)
    end
  end
end
