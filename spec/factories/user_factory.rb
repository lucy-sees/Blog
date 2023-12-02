require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    photo { Faker::Avatar.image }
    bio { Faker::Lorem.paragraph }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    posts_counter { 0 }
  end
end
