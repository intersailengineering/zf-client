FactoryGirl.define do
  factory :property_def, class: Intersail::ZfClient::ZPropertyDef do
    id Faker::Number.number(4)
    name Faker::Name.name
    description ""
    type Faker::Number.number(1)
    process_def_id Faker::Number.number(4)
    default_value ""
    constraint_definition ""
    read_only 0
    internal_property 0
  end
end

