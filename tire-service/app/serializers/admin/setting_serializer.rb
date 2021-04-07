# frozen_string_literal: true

module Admin
  class SettingSerializer < BaseSerializer
    set_type :setting

    set_key_transform :camel_lower

    attributes :vat,
               :title,
               :currency
  end
end
