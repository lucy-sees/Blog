require 'faker'

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 5) }
    text { Faker::Lorem.paragraphs(number: 3).join("\n") }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }

    comments_counter { 0 }
    likes_counter { 0 }

    association :author, factory: :user

    trait :invalid_title do
      title { nil }
    end

    trait :too_long_title do
      title { 'a' * 251 }
    end

    trait :negative_comments_counter do
      comments_counter { -1 }
    end

    trait :negative_likes_counter do
      likes_counter { -1 }
    end
  end
end
