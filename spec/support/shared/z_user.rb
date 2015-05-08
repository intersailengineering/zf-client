module Intersail
  shared_examples "user" do
    it_should_behave_like "default_zero", [:id]
    it "should behave as a ZUser" do
      expect(subject).to have_attr_accessor(:username)
      expect(subject).to have_attr_accessor(:description)
      expect(subject).to have_attr_accessor(:password)
      expect(subject).to have_attr_accessor(:active)
      expect(subject).to have_attr_accessor(:resource)
      expect(subject).to_not have_attr_accessor(:urrs)
    end

    it "should be an active model" do
      expect(subject).to includes(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(subject).to validate_presence_of(:username)
      expect(subject).to validate_exclusion_of(:active).in_array([nil])
      expect(subject).to validate_presence_of(:resource)
      expect(subject).to have_subattribute_validator(:resource)
      expect(subject).to_not have_subattribute_validator(:urrs)
    end
  end
end

