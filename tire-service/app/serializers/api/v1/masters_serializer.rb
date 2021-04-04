# frozen_string_literal: true

module Api
  module V1
    class MastersSerializer < BaseSerializer
      set_type :master

      set_key_transform :camel_lower

      attributes :id,
                 :last_name,
                 :first_name,
                 :father_name,
                 :specialization,
                 :work_experience
    end
  end
end
