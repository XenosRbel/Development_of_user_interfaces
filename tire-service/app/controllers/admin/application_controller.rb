# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    include ::Admin::ApplicationHelper

    before_action :authenticate_user!, :set_current_user
    before_action :set_paper_trail_whodunnit

    respond_to :html
    respond_to :json

    protect_from_forgery with: :exception

    helper_method :action_log

    layout "admin"

    after_action only: %i[create update destroy]

    rescue_from CanCan::AccessDenied do
      if current_user
        redirect_to root_path
      else
        head status: :unauthorized
      end
    end

    def call_rake(task, options = {})
      options[:rails_env] ||= Rails.env
      args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
      system "nohup bundle exec rake #{task} #{args.join(' ')} >> #{Rails.root}/log/rake.log 2>&1 &"
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
      ::User.current = current_user
    end
  end
end
