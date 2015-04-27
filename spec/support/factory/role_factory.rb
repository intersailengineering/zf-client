FactoryGirl.define do
  factory :role, class: Intersail::ZfClient::ZRole do
    id Faker::Number.number(4)
    name Faker::Lorem.word
    description Faker::Lorem.words(5).join(" ")
    parent { FactoryGirl.build(:role_no_parent) }

    factory :role_no_parent, class: Intersail::ZfClient::ZRole do
      parent nil
    end
  end
end