FactoryGirl.define do
  factory :success_pdef_create_res_success, class: Hash do
    ProcessId Faker::Number.number(3)

    initialize_with {attributes.stringify_keys}
  end

  factory :success_pdef_create_res_error, class: Hash do
    ProcessId 0
    Errors { {
        "Code" => Faker::Number.number(3),
        "Message" => "Fake message"
    } }

    initialize_with {attributes.stringify_keys}
  end
end