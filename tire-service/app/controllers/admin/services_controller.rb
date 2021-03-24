# frozen_string_literal: true

module Admin
  class ServicesController < ApplicationController
    datatable model: Service

    def index
      super
    end
  end
end
