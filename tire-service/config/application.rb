# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module TireService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.assets.initialize_on_precompile = false

    config.time_zone = "Minsk"

    config.active_record.schema_format = :ruby

    config.i18n.available_locales = %i[ru en]
    config.i18n.default_locale = :ru

    config.eager_load_paths += %W[
      #{config.root}/app/models/admin/concerns
      #{config.root}/lib/
    ]

    config.action_controller.include_all_helpers = false

    config.action_mailer.merge!(config.x.fetch(:action_mailer))

    config.active_job.queue_adapter = :sidekiq

    config.exceptions_app = routes

    config.active_record.dump_schema_after_migration = false

    config.action_dispatch.default_headers["Referrer-Policy"] = "no-referrer-when-downgrade"

    config.react.addons = true

    HOSTNAME = ENV["HOSTNAME"]
  end
end
