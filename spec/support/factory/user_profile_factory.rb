FactoryGirl.define do
  factory :user_resource, class: Intersail::ZfClient::ZResource do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    mail Faker::Internet.email
    custom_data { FactoryGirl.build(:custom_data) }
  end
end