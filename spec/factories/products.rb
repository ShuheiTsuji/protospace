FactoryGirl.define do
  factory :product do
    catch_copy   { Faker::Lorem.sentence }
    concept      { Faker::Lorem.paragraph }
    title        { Faker::Lorem.sentence }

    trait :with_comments do
      transient do
        comments_count 5
      end
      after(:create) do |product, evaluator|
        evaluator.comments_count.times do
          product.comments.create(text: 'text')
        end
      end
    end
    trait :with_likes do
      transient do
        likes_count 5
      end
      after(:create) do |product, evaluator|
        evaluator.likes_count.times do
          product.likes.create
        end
      end
    end
  end
end
