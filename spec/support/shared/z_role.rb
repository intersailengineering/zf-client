module Intersail
  shared_examples "role" do
    let(:_role) { subject }

    it "should behave as a ZUser" do
      expect(_role).to have_attr_accessor(:id)
      expect(_role).to have_attr_accessor(:name)
      expect(_role).to have_attr_accessor(:description)
      expect(_role).to have_attr_accessor(:parent)

    end

    it "should be an active model" do
      expect(_role).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_role).to validate_presence_of(:name)
      expect(_role).to validate_presence_of(:description)
      expect(_role).to have_subattribute_validator(:parent)
    end
  end
end

