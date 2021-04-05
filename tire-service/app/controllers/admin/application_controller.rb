# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    include Admin::SiteHandler
    include Admin::ApplicationHelper
    include Admin::RespondHelper

    before_action :authenticate_administrator!, :set_current_administrator

    respond_to :html
    respond_to :json

    protect_from_forgery with: :exception

    layout "admin"

    rescue_from CanCan::AccessDenied do |exception|
      if current_administrator
        redirect_to root_path
      else
        flash[:error] = exception.message
        head status: :unauthorized
      end
    end

    def index
      @model_attributes = model_attributes
      @model = model
      @model_items = respond_with_search
    end

    def create
      @model = model.new(model_params)
      redirect_to @model if @model.save
    end

    private

    def redirect_to_action_if_valid(model, action = :index)
      if model.valid?
        redirect_to action: action
      else
        respond_with model
      end
    end

    def authenticate_administrator!
      if administrator_signed_in?
        super
      else
        redirect_to administrator_session_path, notice: "if you want to add a notice"
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

    def model_symbolize
      model.to_s.downcase.split("::").last.to_sym
    end
  end
end
