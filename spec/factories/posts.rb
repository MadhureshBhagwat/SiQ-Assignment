FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Books::Lovecraft.paragraph }
    association :user, factory: :user
  end
end
