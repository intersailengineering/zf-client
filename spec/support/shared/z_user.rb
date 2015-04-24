module Intersail
  shared_examples "user" do
    let(:_user) { subject }

    it "should behave as a ZUser" do
      expect(_user).to have_attr_accessor(:id)
      expect(_user).to have_attr_accessor(:username)
      expect(_user).to have_attr_accessor(:description)
      expect(_user).to have_attr_accessor(:password)
      expect(_user).to have_attr_accessor(:active)
      expect(_user).to have_attr_accessor(:profile)
      expect(_user).to have_attr_accessor(:urr)
    end

    it "should be an active model" do
      expect(_user).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_user).to validate_presence_of(:username)
      expect(_user).to validate_presence_of(:description)
      expect(_user).to validate_presence_of(:password)
      expect(_user).to validate_presence_of(:active)
      expect(_user).to validate_presence_of(:profile)
      expect(_user).to have_subattribute_validator(:profile)
      expect(_user).to have_subattribute_validator(:urr)
    end
  end
end

