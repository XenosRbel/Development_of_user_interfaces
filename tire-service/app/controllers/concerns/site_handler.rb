# frozen_string_literal: true

# Module for resolve different sites
#
# For forms overrided form_for method (see: /config/initializers/action_view.rb)
module SiteHandler
  extend ActiveSupport::Concern

  DEFAULT_LOCALE = "ru"

  included do
    helper_method :params_selected

    def params_selected
      request.params[:selected].presence
    end

    private

    def raise_not_found_error
      raise ActionController::RoutingError, "Not Found"
    end
  end
end
