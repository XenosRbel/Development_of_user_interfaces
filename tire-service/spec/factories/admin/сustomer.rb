# frozen_string_literal: true

FactoryBot.define do
  factory :customer, class: Admin::Customer do
    last_name { FFaker::NameRU.last_name }
    first_name { FFaker::NameRU.first_name }
    father_name { FFaker::NameRU.middle_name_male }
    phone_number { "+375291111111" }
  end
end
