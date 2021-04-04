# frozen_string_literal: true

module Admin
  class HomeController < Admin::ApplicationController
    skip_load_and_authorize_resource

    before_action :report_params, only: %i[index]

    def index; end

    private

    def report_params
      @best_seller_options = best_seller_options
      @customer_growth_options = customer_growth_options
      @orders_accepted_by_master_options = orders_accepted_by_master_options
      @increase_orders_per_day_of_week_options = increase_orders_per_day_of_week_options
    end

    def best_seller_options
      Order.all.group_by(&:total_sum).sort.each_with_object([]) do |element, hash|
        hash << [I18n.t("reports.order", order_id: element.last.first.id), element.first]
      end
    end

    def orders_accepted_by_master_options
      Order.group(:master).count.each_with_object([]) do |element, memo|
        next unless element.first.present?

        memo << [element.first.full_name, element.last]
      end
    end

    def customer_growth_options
      Customer.group_by_month(:created_at).count
    end

    def increase_orders_per_day_of_week_options
      Admin::Order.group_by_day_of_week(:created_at).count
        .each_with_object([]) do |element, memo|
        memo << [Date::DAYNAMES[element.first], element.last]
      end
    end
  end
end
