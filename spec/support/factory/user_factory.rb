FactoryGirl.define do
  factory :user, class: Intersail::ZfClient::ZUser do
    id Faker::Number.positive
    username Faker::Name.name
    description Faker::Name.name
    password Faker::Internet.password(8)
    active true
    profile { FactoryGirl.build(:user_profile) }
    urr { FactoryGirl.build(:urr) }
  end
end