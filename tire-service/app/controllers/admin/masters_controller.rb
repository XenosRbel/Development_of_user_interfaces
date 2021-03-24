# frozen_string_literal: true

module Admin
  class MastersController < ApplicationController
    datatable model: Master
    def index
      super
    end
  end
end
