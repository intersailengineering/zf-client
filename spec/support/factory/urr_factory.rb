FactoryGirl.define do
  factory :urr, class: Intersail::ZfClient::ZUrr do
    role { FactoryGirl.build(:role) }
    user { FactoryGirl.build(:user_no_urr) }
    unit { FactoryGirl.build(:unit) }
  end
end