module Intersail
  shared_examples "urr" do
    let(:_urr) { subject }

    it "should behave as a ZUrr" do
      expect(_urr).to have_attr_accessor(:id)
      expect(_urr).to have_attr_accessor(:role)
      expect(_urr).to have_attr_accessor(:user)
      expect(_urr).to have_attr_accessor(:unit)
      expect(_urr).to have_attr_accessor(:role_id)
      expect(_urr).to have_attr_accessor(:user_id)
      expect(_urr).to have_attr_accessor(:unit_id)
    end

    it "should be an active model" do
      expect(_urr).to extends(ActiveModel::Model)
    end

    it "should validate presence of id params or class param with precedence on ids" do
      # expect(_urr).to validate_presence_of(:role_id)
      # expect(_urr).to validate_presence_of(:unit_id)
      # expect(_urr).to validate_presence_of(:user_id)


    end
  end
end

