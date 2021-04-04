# frozen_string_literal: true

module Admin
  module SiteHandler
    extend ActiveSupport::Concern

    included do
      include ::SiteHandler
    end
  end
end
