# frozen_string_literal: true

FactoryBot.define do
  factory :news, class: Admin::News do
    created_at { FFaker::Random.rand(1..24).months.from_now }
    title { FFaker::Book.title }
    content { FFaker::Lorem.sentences(2).join(" ").html_safe }
  end
end
