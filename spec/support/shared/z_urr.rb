module Intersail
  shared_examples "urr" do
    let(:_urr) { subject }

    it "should behave as a ZProfile" do
      pending "implement attr accessors"
      expect(_user_profile).to have_attr_accessor(:id)
      expect(_user_profile).to have_attr_accessor(:role)
      expect(_user_profile).to have_attr_accessor(:resource)
    end

    it "should be an active model" do
      pending "need to do it"
      expect(_user_profile).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      pending "need to do it"
      expect(_user_profile).to validate_presence_of(:role)
      expect(_user_profile).to validate_presence_of(:resource)
      expect(_user_profile).to have_subattribute_validator(:role)
      expect(_user_profile).to have_subattribute_validator(:resource)
    end
  end
end

