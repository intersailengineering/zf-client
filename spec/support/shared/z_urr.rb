module Intersail
  shared_examples "urr" do
    let(:_urr) { subject }

    it "should behave as a ZUrr" do
      expect(_urr).to have_attr_accessor(:id)
      expect(_urr).to have_attr_accessor(:role)
      expect(_urr).to have_attr_accessor(:user)
      expect(_urr).to have_attr_accessor(:unit)
    end

    it "should be an active model" do
      expect(_urr).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_urr).to validate_presence_of(:role)
      expect(_urr).to validate_presence_of(:unit)
      expect(_urr).to validate_presence_of(:user)
      expect(_urr).to have_subattribute_validator(:role)
      expect(_urr).to have_subattribute_validator(:unit)
      expect(_urr).to have_subattribute_validator(:user)
    end
  end
end

