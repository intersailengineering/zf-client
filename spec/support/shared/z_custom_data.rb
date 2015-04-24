module Intersail
  shared_examples "custom_data" do
    let(:_user) { subject }

    it "should behave as a ZCustomData" do
      pending "implement attr accessors"
      expect(_user).to have_attr_accessor(:name)
      expect(_user).to have_attr_accessor(:value)
    end

    xit "should be an active model"

    xit "should validate his data"

    #@dup extract as mixin this login
    context "serialization" do
      xit "should be serialized as json if valid"
      xit "should not be serialized as json if invalid"
    end
  end
end

