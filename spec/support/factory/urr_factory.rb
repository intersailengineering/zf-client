FactoryGirl.define do
  factory :urr, class: Intersail::ZfClient::ZUrr do
    id Faker::Number.number(4)
    role { FactoryGirl.build(:role) }
    user { FactoryGirl.build(:user_no_urr) }
    unit { FactoryGirl.build(:unit) }

    after(:build) do |urr|
      # Setup relation of user of a given urr
      urr.user.urr = [urr]
    end
  end
end