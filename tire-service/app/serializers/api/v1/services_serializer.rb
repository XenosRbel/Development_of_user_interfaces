# frozen_string_literal: true

module Api
  module V1
    class ServicesSerializer < BaseSerializer
      set_type :services

      set_key_transform :camel_lower

      attributes :id,
                 :description,
                 :title
      attribute :price do |object, _params|
        object.price.round(2)
      end
    end
  end
end
