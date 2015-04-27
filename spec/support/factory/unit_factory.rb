FactoryGirl.define do
  factory :unit, class: Intersail::ZfClient::ZUnit do
    name Faker::Lorem.word
    description Faker::Lorem.words(5)
    parent { FactoryGirl.build(:unit_no_parent) }

    factory :unit_no_parent, class: Intersail::ZfClient::ZUnit do
      parent nil
    end
  end
end