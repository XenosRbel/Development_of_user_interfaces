class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(_resource)
    current_user_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    request.referrer
  end
end
