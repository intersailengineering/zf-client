FactoryGirl.define do
  factory :urr, class: Intersail::ZfClient::ZUrr do
    role { FactoryGirl.build(:role) }
    resource Intersail::ZfClient::ZResource.new
  end
end