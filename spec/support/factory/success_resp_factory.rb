FactoryGirl.define do
  factory :success_pdef_create_res_success, class: Hash do
    process_id Faker::Number.number(3)

    initialize_with {attributes.stringify_keys}
  end

  factory :success_pdef_create_res_error, class: Hash do
    process_id 0
    errors { {
        "code" => Faker::Number.number(3),
        "message" => "Fake message"
    } }

    initialize_with {attributes.stringify_keys}
  end
end