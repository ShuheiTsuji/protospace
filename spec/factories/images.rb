include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    image { fixture_file_upload("spec/fixtures/img/i320.jpeg", 'image/jpeg') }

    trait :main do
      role   :main
    end

    trait :sub do
      role   :sub
    end

    factory :main_image, traits: [:main]
    factory :sub_image,  traits: [:sub]
  end
end

