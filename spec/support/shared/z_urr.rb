module Intersail
  shared_examples "urr" do
    let(:_urr) { subject }

    it "should behave as a ZUrr" do
      expect(_urr).to have_attr_accessor(:id)
      expect(_urr).to have_attr_accessor(:role)
      expect(_urr).to have_attr_accessor(:resource)
    end

    it "should be an active model" do
      expect(_urr).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_urr).to validate_presence_of(:role)
      expect(_urr).to validate_presence_of(:resource)
      expect(_urr).to have_subattribute_validator(:role)
      expect(_urr).to have_subattribute_validator(:resource)
    end
  end
end

