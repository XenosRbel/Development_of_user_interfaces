# frozen_string_literal: true

module Admin
  module ApplicationHelper
    include BootstrapIcons::Rails::BiIconHelper

    def navigation
      @navigation ||= Admin::NavigationBuilder.new.call
    end

    def read_constant(constant_name)
      self.class.const_get(constant_name)
    end
  end
end
