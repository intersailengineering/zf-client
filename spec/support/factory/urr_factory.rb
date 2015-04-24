FactoryGirl.define do
  factory :urr, class: Intersail::ZfClient::ZUrr do
    role Intersail::ZfClient::ZRole.new
    resource Intersail::ZfClient::ZResource.new
  end
end