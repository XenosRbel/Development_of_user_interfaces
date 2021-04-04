# frozen_string_literal: true

class PhoneNumberValidator < ActiveModel::Validator
  def validate(record)
    return if valid_phone_number?(record)

    record.errors.add(options[:field], :invalid_number_format)
  end

  private

  PHONE_NUMBER_PATTERN = /^\+375(17|29|33|44)\d{3}\d{2}\d{2}$/.freeze

  def valid_phone_number?(record)
    phone_number = record.__send__(options[:field])
    (phone_number =~ PHONE_NUMBER_PATTERN).present?
  end
end
