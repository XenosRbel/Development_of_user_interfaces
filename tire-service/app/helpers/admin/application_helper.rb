# frozen_string_literal: true

module Admin
  module ApplicationHelper
    include BootstrapIcons::Rails::BiIconHelper

    def navigation
      @navigation ||= Admin::NavigationBuilder.new.call
    end
  end
end
