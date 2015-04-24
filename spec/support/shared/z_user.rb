module Intersail
  shared_examples "user" do
    let(:_user) { subject }

    it "should behave as a ZUser" do
      pending "implement attr accessors"
      expect(_user).to have_attr_accessor(:id)
      expect(_user).to have_attr_accessor(:username)
      expect(_user).to have_attr_accessor(:description)
      expect(_user).to have_attr_accessor(:password)
      expect(_user).to have_attr_accessor(:active)
      expect(_user).to have_attr_accessor(:info)
    end

    xit "should be an active model"

    xit "should validate his data"

    #@jtodoIMP before this extract p_instance validation login and use it here
    #@dup extract as mixin this login
    context "serialization" do
      xit "should be serialized as json if valid"
      xit "should not be serialized as json if not valid"
      xit "should ask his info if it's valid"

    end
  end
end

