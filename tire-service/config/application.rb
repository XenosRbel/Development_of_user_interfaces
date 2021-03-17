# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TireService
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = "Minsk"
    config.i18n.available_locales = %i[ru en]
    config.i18n.default_locale = :ru

    config.eager_load_paths += %W[
      #{config.root}/lib/
    ]

    config.action_controller.include_all_helpers = false

    config.exceptions_app = routes

    config.active_record.dump_schema_after_migration = false

    # Default value for 'Referrer-Policy' header is 'strict-origin-when-cross-origin'.
    # Change it to 'no-referrer-when-downgrade'
    config.action_dispatch.default_headers["Referrer-Policy"] = "no-referrer-when-downgrade"
  end
end
