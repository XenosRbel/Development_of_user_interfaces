# frozen_string_literal: true

module Admin
  class HomeController < ApplicationController
    skip_load_and_authorize_resource

    def index; end

    def denied; end
  end
end
