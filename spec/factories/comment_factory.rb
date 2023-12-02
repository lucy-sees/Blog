require 'faker'

FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.paragraph }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    association :user, factory: :user
    association :post, factory: :post
  end
end
