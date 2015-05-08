FactoryGirl.define do
  factory :process_def, class: Intersail::ZfClient::ZProcessDef do
    id Faker::Number.digit
    name Faker::Name.name
    ignore_history false
    app_domain Faker::Name.name.upcase
  end
end