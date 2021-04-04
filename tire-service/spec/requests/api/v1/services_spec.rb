# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "api/v1/services", type: :request do
  before { Admin::Service.new.save }

  path "/services" do
    operationId "GET" do
      response 200, description: "successful"
    end
  end
end
