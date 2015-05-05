FactoryGirl.define do
  factory :user, class: Intersail::ZfClient::ZUser do
    id SecureRandom.uuid
    username Faker::Name.name
    description Faker::Name.name
    password Faker::Internet.password(8)
    active true
    resource { FactoryGirl.build(:user_resource) }
  end
end