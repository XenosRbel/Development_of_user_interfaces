# frozen_string_literal: true

FactoryBot.define do
  factory :master, class: Admin::Master do
    last_name { FFaker::NameRU.last_name }
    first_name { FFaker::NameRU.first_name }
    father_name { FFaker::NameRU.middle_name_male }
    phone_number { "+37529#{rand(10**7)}" }
    specialization { FFaker::Education.degree }
    work_experience { FFaker::Random.rand(0.0..9) }
  end
end
