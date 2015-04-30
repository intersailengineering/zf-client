FactoryGirl.define do
  factory :user, class: Intersail::ZfClient::ZUser do
    id Faker::Number.positive
    username Faker::Name.name
    description Faker::Name.name
    password Faker::Internet.password(8)
    active true
    resource { FactoryGirl.build(:user_resource) }
    urrs { [FactoryGirl.build(:urr)] }

    after(:build) do |user|
      # Setup relation of first urr user
      user.urrs[0].user = user unless user.urrs.empty?
    end

    factory :user_no_urr, class: Intersail::ZfClient::ZUser do
      urrs []
    end
  end
end