# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    content { Faker::Books::Lovecraft.paragraph }
    association :user, factory: :user
    association :post, factory: :post
  end
end
