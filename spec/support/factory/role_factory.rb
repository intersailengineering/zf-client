FactoryGirl.define do
  factory :role, class: Intersail::ZfClient::ZRole do
    name Faker::Lorem.word
    description Faker::Lorem.words(5)
    parent { FactoryGirl.build(:role_no_parent) }

    factory :role_no_parent, class: Intersail::ZfClient::ZRole do
      parent nil
    end
  end
end