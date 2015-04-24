module Intersail
  shared_examples "user_info" do
    let(:_user) { subject }

    it "should behave as a ZUserInfo" do
      pending "implement attr accessors"
      expect(_user).to have_attr_accessor(:cognome)
      expect(_user).to have_attr_accessor(:nome)
      expect(_user).to have_attr_accessor(:mail)
      expect(_user).to have_attr_accessor(:custom_data)
    end

    xit "should be an active model"

    xit "should validate his data"

    #@dup extract as mixin this login
    context "serialization" do
      xit "should be serialized as json if valid"
      xit "should not be serialized as json if invalid"
      xit "should check for his custom data to be valid"
    end
  end
end

