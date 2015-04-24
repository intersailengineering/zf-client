FactoryGirl.define do
  factory :user, class: Intersail::ZfClient::ZUser do
    id Faker::Number.positive
    username Faker::Name.name
    description Faker::Name.name
    password Faker::Internet.password(8)
    active true
    info { FactoryGirl.build(:user_info) }
  end
end