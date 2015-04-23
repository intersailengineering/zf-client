FactoryGirl.define do
  factory :z_process_property, class: Intersail::ZfClient::ZProcessProperty do
    name Faker::Name.name
    value Faker::Name.name
  end
end