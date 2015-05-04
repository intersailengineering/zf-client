module Intersail
  shared_examples "urr" do
    it "should behave as a ZUrr" do
      expect(subject).to have_attr_accessor(:id)
      expect(subject).to have_attr_accessor(:unit)
      expect(subject).to have_attr_accessor(:role)
      expect(subject).to have_attr_accessor(:resource)
      expect(subject).to have_attr_accessor(:unit_id)
      expect(subject).to have_attr_accessor(:role_id)
      expect(subject).to have_attr_accessor(:resource_id)
    end

    it "should be an active model" do
      expect(subject).to includes(ActiveModel::Model)
    end

    it "should validate presence of id params or class param with precedence on ids" do
      delete_object_attributes
      expect(subject).to validate_presence_of(:unit_id)
      expect(subject).to validate_presence_of(:role_id)
      expect(subject).to validate_presence_of(:resource_id)
    end

    def delete_object_attributes
      subject.role = nil
      subject.resource = nil
      subject.unit = nil
    end
  end
end

