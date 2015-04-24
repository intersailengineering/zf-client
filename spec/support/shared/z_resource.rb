module Intersail
  shared_examples "resource" do
    let(:_resource) { subject }

    it "should behave as a ZUser" do
      pending "need to implement it"
      expect(_resource).to have_attr_accessor(:id)
    end

    it "should be an active model" do
      expect(_resource).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      pending "need to implement it"
      expect(_resource).to validate_presence_of(:username)
      expect(_resource).to have_subattribute_validator(:urr)
    end
  end
end

