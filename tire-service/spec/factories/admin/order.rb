# frozen_string_literal: true

FactoryBot.define do
  factory :order, class: Admin::Order do
    services { build_list :service, 1 }
    start_execution_at { FFaker::Random.rand(0..10).days.ago }
    end_execution_at { FFaker::Random.rand(0..10).days.from_now }
    association :master, factory: :master, strategy: :build
    association :discount, factory: :discount, strategy: :build
    association :customer, factory: :customer, strategy: :build
  end
end
