# frozen_string_literal: true

module Front
  class ApplicationController < ::ApplicationController
    respond_to :json, only: [:localized_strings]

    protect_from_forgery with: :exception

    before_action :set_locale

    private

    def set_locale
      I18n.locale = params.fetch(:locale) { I18n.default_locale }
    end

    def localized_strings
      respond_with t(params[:string_code])
    end
  end
end
