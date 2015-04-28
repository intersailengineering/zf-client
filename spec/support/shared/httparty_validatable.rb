module Intersail
  shared_examples "httparty_validatable" do
    let(:fake_data) { %Q/{"fake" : "fake_json"}/ }

    it { is_expected.to extends(HTTParty) }

    context "header" do
      it "should pass authorization data in the hedader" do
        expect(subject.header["X-ZToken"]).to be == subject.z_token
      end

      it "should pass data content json in header" do
        expect(subject.header["Accept"]).to be == 'application/json'
      end
    end

    context "attributes" do
      it "should have a token" do
        expect(subject).to have_attr_accessor(:z_token)
      end
    end

    context "configuration" do
      it "should use base_uri= method to set base_uri" do
        base_uri = Faker::Internet.url
        subject.base_uri = base_uri

        expect(subject.base_uri).to be == base_uri
        expect(subject.class.base_uri).to be == base_uri
      end

      it "should setup token and base_uri" do
        token = SecureRandom.uuid
        uri = Faker::Internet.url
        obj = subject.class.new(token, uri)

        expect(obj.z_token).to be == token
        expect(obj.base_uri).to be == uri
      end

      it "should run after_initialize callback after initialize" do
        expect_any_instance_of(subject.class).to receive(:after_initialize)
        subject.class.new
      end
    end

    context "validation" do
      it "should raise exception if invalid" do
        invalid = double("invalid")
        expect(invalid).to receive(:valid?) { false }
        error_message = "fake error message"
        expect(invalid).to receive_message_chain(:errors, :full_messages) { error_message }

        expect { subject.doValidation(invalid) }.to raise_error(Intersail::Errors::StandardValidationError, error_message)
      end

      it "should do nothing if valid" do
        valid = double("valid")
        expect(valid).to receive(:valid?) { true }

        subject.doValidation(valid)
      end
    end

    context "post" do
      it "should validate data and call post" do
        expect(subject).to receive(:doValidation)

        jsonable = double(as_json: "{}")
        uri = "/RelativeUri.aspx"

        expect(subject.class).to receive(:post).with(uri, body: "{}", headers: subject.header) { fake_data }
        subject.post(jsonable, uri)
      end
    end

    context "get" do
      xit "should validate data and call get"
    end

    context "delete" do
      xit "should validate data and call delete"
    end
  end
end