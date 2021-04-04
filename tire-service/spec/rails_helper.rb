# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../config/environment", __dir__)
require "rspec/rails"
require "factory_bot_rails"
require "pry-rails"
require "admin"
require "front"
require "api"
require "timecop/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.file_fixture_path = config.fixture_path
  config.use_transactional_fixtures = false

  WebMock.allow_net_connect!(net_http_connect_on_start: true)

  config.around(:example, offline: true) do |example|
    WebMock.disable_net_connect!
    example.run
    WebMock.allow_net_connect!(net_http_connect_on_start: true)
  end

  config.around(:example) do |example|
    Timecop::Rspec.time_machine(sequential: true).run(example)
  end

  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation

    DatabaseCleaner.cleaning do
      FactoryBot.lint
    end
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do |example|
    RequestStore.clear!
    DatabaseCleaner.start unless example.metadata[:skip_db_cleaner]
  end

  config.append_after(:each) do |example|
    DatabaseCleaner.clean unless example.metadata[:skip_db_cleaner]
  end
end
