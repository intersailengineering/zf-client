FactoryGirl.define do
  factory :create_user_success_res, parent: :user do

    after(:build) do |user|
      user.as_json
    end
  end
end