FactoryGirl.define do
  factory :create_user_success_res, class: Hash do

    initialize_with {attributes.stringify_keys}
  end
end