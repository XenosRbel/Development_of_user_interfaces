# frozen_string_literal: true

module Api
  module V1
    class CustomersSerializer < BaseSerializer
      set_type :customer

      set_key_transform :camel_lower

      attributes :id,
                 :first_name,
                 :last_name,
                 :father_name
    end
  end
end
