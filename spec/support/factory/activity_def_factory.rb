FactoryGirl.define do
  factory :activity_def, class: Intersail::ZfClient::ZActivityDef do
    id Faker::Number.number(4)
    name Faker::Name.name
    type Faker::Number.number(1)
    in_param_string ""
    manager ""
    process_result 0
    process_definition_id Faker::Number.number(2)
    enabled true
  end
end

