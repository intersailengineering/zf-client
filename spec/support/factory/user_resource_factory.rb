FactoryGirl.define do
  factory :user_resource, class: Intersail::ZfClient::ZResource do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    mail Faker::Internet.email
    custom_data Hash.new({
      "field1" => Faker::Name.name,
      "field2" => Faker::Name.name
    })
    urrs { [FactoryGirl.build(:urr)] }

    after(:build) do |resource|
      # Setup relation of first urr resource
      resource.urrs[0].resource = resource unless resource.urrs.empty?
    end

    # used to avoid loop because an urr is associated to a resource which is associated
    # to an urr, and if you build this recursively you would have an infinite stack
    factory :user_resource_no_urr do
      urrs []
    end
  end
end