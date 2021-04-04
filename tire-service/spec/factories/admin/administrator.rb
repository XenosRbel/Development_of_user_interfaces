# frozen_string_literal: true

FactoryBot.define do
  factory :administrator, class: Admin::Administrator do
    voucher { "voucher" }
    password { FFaker::Internet.password }
    role { "manager" }
    email { FFaker::Internet.email }
    last_name { FFaker::NameRU.last_name }
    first_name { FFaker::NameRU.first_name }
    father_name { FFaker::NameRU.middle_name_male }
    phone_number { "+375292223344" }
  end
end
