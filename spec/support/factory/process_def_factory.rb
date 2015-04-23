FactoryGirl.define do
  factory :z_process_def, class: Intersail::ZfClient::ZProcessDef do
    process_def_id Faker::Number.number(4)
    name Faker::Name.name
    description Faker::Name.name
    properties do
      # Build a random 1-9 size array of properties
      prop_arr = []
      (Faker::Number.digit.to_i).times do
        prop_arr << (FactoryGirl.build :z_process_property)
      end
      prop_arr
    end
  end
end