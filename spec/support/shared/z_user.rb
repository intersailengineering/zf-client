module Intersail
  shared_examples "user" do
    let(:_user) { subject }

    it "should behave as a ZUser" do
      expect(_user).to have_attr_accessor(:id)
      expect(_user).to have_attr_accessor(:username)
      expect(_user).to have_attr_accessor(:description)
      expect(_user).to have_attr_accessor(:password)
      expect(_user).to have_attr_accessor(:active)
      expect(_user).to have_attr_accessor(:resource)
      expect(_user).to_not have_attr_accessor(:urrs)
    end

    it "should be an active model" do
      expect(_user).to includes(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_user).to validate_presence_of(:username)
      expect(_user).to validate_exclusion_of(:active).in_array([nil])
      expect(_user).to validate_presence_of(:resource)
      expect(_user).to have_subattribute_validator(:resource)
      expect(_user).to_not have_subattribute_validator(:urrs)
    end
  end
end

