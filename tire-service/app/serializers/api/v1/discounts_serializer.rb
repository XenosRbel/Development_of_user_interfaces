# frozen_string_literal: true

module Api
  module V1
    class DiscountsSerializer < BaseSerializer
      set_type :discount

      set_key_transform :camel_lower

      attributes :id,
                 :title,
                 :description,
                 :end_date_at,
                 :start_date_at,
                 :percent
    end
  end
end
