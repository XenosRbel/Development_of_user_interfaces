# frozen_string_literal: true

module Admin
  class AdministratorsController < ApplicationController
    load_and_authorize_resource
    skip_load_resource only: :index
    before_action :select_option_collection, only: %i[edit new update]

    datatable model: Administrator, exclude_attributes: %w[encrypted_password
                                                           reset_password_token
                                                           reset_password_sent_at
                                                           remember_created_at
                                                           created_at
                                                           updated_at]
    def index
      super
    end

    private

    def select_option_collection
      @role_select_options = Administrator::AVAILABLE_ROLES.map do |role|
        [I18n.t("activerecord.attributes.administrator.roles.#{role}"), role, { data: { type: role } }]
      end
    end
  end
end
