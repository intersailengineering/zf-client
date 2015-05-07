module Intersail
  shared_examples "unit" do
    let(:_unit) { subject }
    it_behaves_like "default_zero_idable"
    it "should behave as a ZUser" do
      expect(_unit).to have_attr_accessor(:id)
      expect(_unit).to have_attr_accessor(:name)
      expect(_unit).to have_attr_accessor(:description)
      expect(_unit).to have_attr_accessor(:parent)

    end

    it "should be an active model" do
      expect(_unit).to includes(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_unit).to validate_presence_of(:name)
      expect(_unit).to validate_presence_of(:description)
      expect(_unit).to have_subattribute_validator(:parent)
    end
  end
end

