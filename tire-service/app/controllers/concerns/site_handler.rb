# frozen_string_literal: true

# Module for resolve different sites
#
# For forms overrided form_for method (see: /config/initializers/action_view.rb)
module SiteHandler
  extend ActiveSupport::Concern

  DEFAULT_LOCALE = "ru"

  included do
    private

    def stripped_domain
      request.env["HTTP_HOST"].sub("www.", "")
    end
  end
end
