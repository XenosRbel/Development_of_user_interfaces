# frozen_string_literal: true

FactoryBot.define do
  factory :discount, class: Admin::Discount do
    percent { FFaker::Random.rand(0..100) }
    description { FFaker::Lorem.characters }
    title { FFaker::Lorem.words }
    start_date_at { FFaker::Random.rand(0..10).days.ago }
    end_date_at { FFaker::Random.rand(0..10).days.from_now }
  end
end
