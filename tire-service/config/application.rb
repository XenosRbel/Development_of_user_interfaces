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

    HOSTNAME = ENV["HOSTNAME"]
  end
end
