module Intersail
  shared_examples "custom_data" do
    let(:_custom_data) { subject }

    it "should behaves as a ZCustomData" do
      expect(_custom_data).to have_attr_accessor(:id)
      expect(_custom_data).to have_attr_accessor(:name)
      expect(_custom_data).to have_attr_accessor(:value)
    end

    it "should be an active model" do
      expect(_custom_data).to extends(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_custom_data).to validate_presence_of(:name)
      expect(_custom_data).to validate_presence_of(:value)
    end
  end
end

