# frozen_string_literal: true

require "application_responder"

class ApplicationController < ::ActionController::Base
  include ::ApplicationHelper

  self.responder = ApplicationResponder
  respond_to :html

  private

  def after_sign_out_path_for(_resource_or_scope)
    Admin::Engine.routes.url_helpers.root_path
  end

  def after_sign_in_path_for(_resource)
    Admin::Engine.routes.url_helpers.root_path
  end
end
