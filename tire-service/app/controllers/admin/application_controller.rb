# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    include SiteHandler
    include ApplicationHelper

    before_action :authenticate_user!, :set_current_user

    respond_to :html
    respond_to :json

    protect_from_forgery with: :exception

    layout "admin"

    rescue_from CanCan::AccessDenied do
      if current_user
        redirect_to root_path
      else
        head status: :unauthorized
      end
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

    def set_current_user
      User.current = current_user
    end

    def current_ability
      @current_ability ||= Abilities::Factory.build(current_user)
    end
  end
end
