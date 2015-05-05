FactoryGirl.define do
  factory :z_process_inst, class: Intersail::ZfClient::ZProcessInstance do
    id Faker::Number.number(4)
    process_def_id Faker::Number.number(4)
    parent_process_id Faker::Number.number(4)
    name Faker::Name.name
    description Faker::Name.name
    properties { Hash.new({prop1: Faker::Name.name}) }
  end
end