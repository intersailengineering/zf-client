module Intersail
  shared_examples "acl" do
    let(:_acl) { subject }

    it "should behaves as a ZAcl" do
      expect(_acl).to have_attr_accessor(:id)
      expect(_acl).to have_attr_accessor(:process_id)
      expect(_acl).to have_attr_accessor(:activity_id)
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
      expect(_acl).to validate_presence_of(:process_id)
      expect(_acl).to validate_presence_of(:activity_id)
      expect(_acl).to validate_presence_of(:unit_id)
      expect(_acl).to validate_presence_of(:role_id)
      expect(_acl).to validate_presence_of(:resource_id)
      expect(_acl).to validate_presence_of(:permission)
      expect(_acl).to validate_presence_of(:priority)
      expect(_acl).to validate_presence_of(:inherit_unit)
      expect(_acl).to validate_presence_of(:inherit_role)
      #@jtodoIMP here not use presence but just check that is not nil
      expect(_acl).to validate_presence_of(:mandatory)
      expect(_acl).to validate_presence_of(:enabled)
    end
  end
end

