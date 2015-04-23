module Intersail
  shared_examples "client_validatable" do
    let(:_api_cli) { subject }

    context "header" do
      it "should pass authorization data in the hedader" do
        expect(subject.header["X-ZToken"]).to be == subject.z_token
      end

      it "should pass data content json in header" do
        expect(subject.header["Accept"]).to be == 'application/json'
      end
    end

    #@jtodoIMP go from here and test

    context "validation" do
      xit "should raise exception if invalid"
      xit "should do nothing if valid"
    end

    context "post" do
      # here check for post with valid args
      xit "should validate data and call post"
    end

    context "get" do
      xit "should validate data and call get"
    end

    context "delete" do
      xit "should validate data and call delete"
    end
  end
end