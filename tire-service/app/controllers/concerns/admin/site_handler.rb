# frozen_string_literal: true

module Admin
  module SiteHandler
    extend ActiveSupport::Concern

    included do
      include ::SiteHandler

      delegate :not_site_to_params, to: :class

      class << self
        attr_reader :not_site_to_params

        def not_add_site_to_params(value = true)
          @not_site_to_params = value
        end
      end

      private

      def fetch_site(site_id, _)
        return if current_user.blank? || site_id.blank?
        raise ActiveRecord::RecordNotFound unless Site.exists? site_id

        site = current_user.sites.find_by id: site_id
        raise CanCan::AccessDenied if site.blank?

        site
      end
    end
  end
end
