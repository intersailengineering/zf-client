FactoryGirl.define do
  factory :custom_data, class: Intersail::ZfClient::ZCustomData do
    name "Fake name"
    value "Fake val"
  end
end