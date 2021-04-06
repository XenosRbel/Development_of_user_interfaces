# frozen_string_literal: true

module Admin
  class AdministratorsController < Admin::ApplicationController
    include Admin::Datatable

    load_and_authorize_resource
    skip_load_resource only: :index

    before_action :select_option_collection, only: %i[edit new update]

    datatable model: Administrator, exclude_attributes: %w[encrypted_password
                                                           reset_password_token
                                                           reset_password_sent_at
                                                           remember_created_at
                                                           created_at
                                                           updated_at]

    UPDATE_MODEL_PARAMS = %i[last_name
                             first_name
                             father_name
                             phone_number
                             email
                             role].freeze
    MODEL_PARAMS = UPDATE_MODEL_PARAMS

    def show
      respond_html_json_and_pdf_for(@administrator)
    end

    def create
      @administrator = model.create(model_params)
      respond_with @administrator, location: administrators_path
    end

    def update
      @administrator.update(model_params)
      respond_with @administrator, location: administrator_path
    end

    def destroy
      @administrator.destroy
      redirect_to administrators_path
    end

    private

    def select_option_collection
      @role_select_options = Administrator::AVAILABLE_ROLES.map do |role|
        [I18n.t("activerecord.attributes.admin/administrator.roles.#{role}"), role, { data: { type: role } }]
      end
    end
  end
end
