# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!, :set_current_user
    before_action :set_paper_trail_whodunnit

    respond_to :html
    respond_to :json

    protect_from_forgery with: :exception

    rescue_from CanCan::AccessDenied do
      if current_user
        redirect_to root_path
      else
        head status: :unauthorized
      end
    end

    def set_current_user
      User.current = current_user
    end
  end
end
