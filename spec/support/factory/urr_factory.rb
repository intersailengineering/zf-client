FactoryGirl.define do
  factory :urr, class: Intersail::ZfClient::ZUrr do
    role { FactoryGirl.build(:role) }
    user { FactoryGirl.build(:user_no_urr) }
    #@jtodoIMP add the unit
    unit Intersail::ZfClient::ZUnit.new
  end
end