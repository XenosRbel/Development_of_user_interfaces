# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    include SiteHandler
    include ApplicationHelper
    include Datatable

    before_action :authenticate_administrator!, :set_current_administrator

    respond_to :html
    respond_to :json

    protect_from_forgery with: :exception

    layout "admin"

    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to root_path
    end

    def index
      @model_attributes = model_attributes
      @model = model
      @model_items = @model.all
    end

    private

    def redirect_to_action_if_valid(model, action = :index)
      if model.valid?
        redirect_to action: action
      else
        respond_with model
      end
    end

    def redirect_back_or_root(**args)
      redirect_back(fallback_location: root_path, **args)
    end

    def set_current_administrator
      Admin::Administrator.current = current_administrator
    end

    def current_ability
      @current_ability ||= Abilities::Factory.build(current_administrator)
    end

    def model_params
      params.require(model_symbolize).permit(*read_constant(:MODEL_PARAMS))
    end

    def update_model_params
      params.require(model_symbolize).permit(*read_constant(:UPDATE_MODEL_PARAMS))
    end

    def model_symbolize
      model.to_s.downcase.split("::").last.to_sym
    end
  end
end
