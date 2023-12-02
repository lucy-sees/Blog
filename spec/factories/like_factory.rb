require 'faker'

FactoryBot.define do
  factory :like do
    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    association :user
    association :post
  end
end
