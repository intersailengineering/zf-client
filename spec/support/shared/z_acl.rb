module Intersail
  shared_examples "acl" do
    let(:_acl) { subject }

    it_should_behave_like "default_zero", [:id]
    it "should behaves as a ZAcl" do
      expect(_acl).to have_attr_accessor(:id)
      expect(_acl).to have_attr_accessor(:process_def_id)
      expect(_acl).to have_attr_accessor(:activity_def_id)
      expect(_acl).to have_attr_accessor(:unit_id)
      expect(_acl).to have_attr_accessor(:role_id)
      expect(_acl).to have_attr_accessor(:resource_id)
      expect(_acl).to have_attr_accessor(:permission)
      expect(_acl).to have_attr_accessor(:priority)
      expect(_acl).to have_attr_accessor(:inherit_unit)
      expect(_acl).to have_attr_accessor(:inherit_role)
      expect(_acl).to have_attr_accessor(:mandatory)
      expect(_acl).to have_attr_accessor(:enabled)
    end

    it "should be an active model" do
      expect(_acl).to includes(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_acl).to validate_presence_of(:process_def_id)
      expect(_acl).to validate_presence_of(:activity_def_id)
      expect(_acl).to validate_presence_of(:unit_id)
      expect(_acl).to validate_presence_of(:role_id)
      expect(_acl).to validate_presence_of(:resource_id)
      expect(_acl).to validate_presence_of(:permission)
      expect(_acl).to validate_presence_of(:priority)
      expect(subject).to validate_exclusion_of(:inherit_unit).in_array([nil])
      expect(subject).to validate_exclusion_of(:inherit_role).in_array([nil])
      expect(subject).to validate_exclusion_of(:mandatory).in_array([nil])
      expect(subject).to validate_exclusion_of(:enabled).in_array([nil])
    end
  end
end

