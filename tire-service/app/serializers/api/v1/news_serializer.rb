# frozen_string_literal: true

module Api
  module V1
    class NewsSerializer < BaseSerializer
      set_type :news

      set_key_transform :camel_lower

      attributes :id,
                 :title,
                 :content
    end
  end
end
