module Intersail
  shared_examples "user_resource" do
    let(:_user) { subject }

    it_behaves_like "default_zero_idable"
    it "should behave as a ZResource" do
      expect(_user).to have_attr_accessor(:id)
      expect(_user).to have_attr_accessor(:first_name)
      expect(_user).to have_attr_accessor(:last_name)
      expect(_user).to have_attr_accessor(:mail)
      expect(_user).to have_attr_accessor(:custom_data)
      expect(_user).to have_attr_accessor(:urrs)
    end

    it "should be an active model" do
      expect(_user).to includes(ActiveModel::Model)
    end

    it "should validate his data" do
      expect(_user).to validate_presence_of(:first_name)
      expect(_user).to validate_presence_of(:last_name)
      expect(_user).to have_subattribute_validator(:urrs)
    end
  end
end

