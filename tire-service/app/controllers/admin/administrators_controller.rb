# frozen_string_literal: true

module Admin
  class AdministratorsController < ApplicationController
    datatable model: Administrator, exclude_attributes: %w[encrypted_password
                                                           reset_password_token
                                                           reset_password_sent_at
                                                           remember_created_at
                                                           created_at
                                                           updated_at]
    def index
      super
    end
  end
end
