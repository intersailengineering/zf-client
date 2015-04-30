FactoryGirl.define do
  factory :urr, class: Intersail::ZfClient::ZUrr do
    id Faker::Number.number(4)
    role { FactoryGirl.build(:role) }
    resource { FactoryGirl.build(:user_resource_no_urr) }
    unit { FactoryGirl.build(:unit) }
    role_id Faker::Number.number(2)
    resource_id Faker::Number.number(2)
    unit_id Faker::Number.number(2)

    after(:build) do |urr|
      # Setup relation of user of a given urr
      urr.resource.urrs = [urr]
    end
  end
end