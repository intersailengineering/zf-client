FactoryGirl.define do
  factory :role, class: Intersail::ZfClient::ZRole do
    name Faker::Lorem.word
    description Faker::Lorem.words(5)
    parent { FactoryGirl.build(:role_no_parent) }
  end

  factory :role_no_parent, class: Intersail::ZfClient::ZRole do
    id Faker::Number.number(2)
    name Faker::Lorem.word
    description Faker::Lorem.words(5)
    parent nil
  end
end