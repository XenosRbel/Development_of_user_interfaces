# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../config/environment", __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require "rspec/rails"
require "factory_bot_rails"
require "pry-rails"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => exception
  puts exception.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.file_fixture_path = config.fixture_path
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  config.around(:example, offline: true) do |example|
    WebMock.disable_net_connect!
    example.run
    WebMock.allow_net_connect!(net_http_connect_on_start: true)
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation, except: %w[
      addr
      county_lookup
    ]

    DatabaseCleaner.cleaning do
      FactoryBot.lint
    end
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do |example|
    # https://github.com/DatabaseCleaner/database_cleaner/issues/519
    DatabaseCleaner.start unless example.metadata[:skip_db_cleaner]
  end

  config.append_after(:each) do |example|
    DatabaseCleaner.clean unless example.metadata[:skip_db_cleaner]
  end
end
