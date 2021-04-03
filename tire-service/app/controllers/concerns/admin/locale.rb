# frozen_string_literal: true

module Admin
  module Locale
    extend ActiveSupport::Concern

    included do
      helper_method :t

      def t(key, options = {})
        super key, options.deep_merge(scope: :admin) { |_key, prev_value, curr_value| "#{curr_value}.#{prev_value}" }
      end
    end
  end
end
