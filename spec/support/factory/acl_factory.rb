FactoryGirl.define do
  factory :acl, class: Intersail::ZfClient::ZAcl do
    process_def_id Faker::Number.digit
    activity_def_id Faker::Number.digit
    unit_id Faker::Number.digit
    role_id Faker::Number.digit
    resource_id Faker::Number.digit
    permission Faker::Lorem.characters(3)
    priority Faker::Number.digit
    inherit_unit false
    inherit_role false
    mandatory true
    enabled true
  end
end