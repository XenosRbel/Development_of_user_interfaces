# frozen_string_literal: true

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin

    Rails.application.config.to_prepare do
      Devise::RegistrationsController.layout proc { |_controller| user_signed_in? ? "admin" : "devise" }
    end
  end
end
