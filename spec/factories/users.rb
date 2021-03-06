FactoryGirl.define do
  factory :user do
     name              'aaa'
     email             { Faker::Internet.email }
     password          { Faker::Internet.password(8) }
     profile           { Faker::University.name }
     member            { Faker::Team.sport }
     works             { Faker::Company.name }
  end
end

