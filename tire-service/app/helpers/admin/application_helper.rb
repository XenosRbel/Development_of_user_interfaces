# frozen_string_literal: true

module Admin
  module ApplicationHelper
    def navigation
      @navigation ||= Admin::NavigationBuilder.new.call
    end
  end
end
