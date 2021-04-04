# frozen_string_literal: true

FactoryBot.define do
  factory :service, class: Admin::Service do
    price { FFaker::Random.rand(0..1000) }
    description { FFaker::Lorem.characters }
    title { FFaker::Lorem.words }
  end
end
