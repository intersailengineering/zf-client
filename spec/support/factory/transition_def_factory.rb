FactoryGirl.define do
  factory :transition_def, class: Intersail::ZfClient::ZTransitionDef do
    id Faker::Number.number(4)
    name Faker::Name.name
    activity_result Faker::Number.number(1)
    rules ""
    manager ""
    priority 0
    start_activity_id Faker::Number.number(4)
    end_activity_id Faker::Number.number(4)
    process_definition_id Faker::Number.number(4)
    user_change_required 0
    comment_title ""
    reverse_transition_id Faker::Number.number(4)
  end
end

