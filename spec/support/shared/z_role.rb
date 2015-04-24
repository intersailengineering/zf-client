module Intersail
  shared_examples "role" do
    let(:_role) { subject }

    it "should behave as a ZUser" do
      pending "need to implement it"
      expect(_role).to have_attr_accessor(:id)
    end

    it "should be an active model" do
      expect(_role).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      pending "need to implement it"
      expect(_role).to validate_presence_of(:username)
      expect(_role).to have_subattribute_validator(:urr)
    end
  end
end

