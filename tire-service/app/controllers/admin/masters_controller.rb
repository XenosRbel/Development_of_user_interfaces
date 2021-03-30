# frozen_string_literal: true

module Admin
  class MastersController < ApplicationController
    datatable model: Master, exclude_attributes: %w[created_at updated_at]
    def index
      super
    end
  end
end
