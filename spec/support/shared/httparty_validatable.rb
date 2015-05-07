module Intersail

  shared_examples "httparty_validatable" do
    let(:fake_data) { OpenStruct.new(body: %Q/{"fake" : "fake_json"}/, code: 200) }

    it { is_expected.to includes(HTTParty) }

    context "header" do
      it "should pass authorization data in the hedader" do
        expect(subject.header["X-ZToken"]).to be == subject.z_token
      end

      it "should pass content-type json in header" do
        expect(subject.header["Content-Type"]).to be == 'application/json'
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
      it "should skip validation for empty objects" do
        subject.doValidation(nil)
      end

      it "should check if given param is validatable if obj is not empty" do
        invalid = double("without_valid?")
        expect(invalid).to receive(:nil?) { false }
        expect { subject.doValidation(invalid) }.to raise_error(Intersail::Errors::StandardValidationError, "You need to provide a validatable object")
      end

      it "should raise exception if invalid" do
        invalid = double("invalid")
        expect(invalid).to receive(:nil?) { false }
        expect(invalid).to receive(:valid?) { false }
        error_message = "fake error message"
        expect(invalid).to receive_message_chain(:errors, :full_messages) { error_message }

        expect { subject.doValidation(invalid) }.to raise_error(Intersail::Errors::StandardValidationError, error_message)
      end

      it "should do nothing if valid" do
        valid = double("valid")
        expect(valid).to receive(:nil?) { false }
        expect(valid).to receive(:valid?) { true }

        subject.doValidation(valid)
      end
    end

    context "error handling" do
      it "should raise exception on server 500" do
        allow_any_instance_of(subject.class).to receive(:send) { OpenStruct.new(code: 500, body: "fake body") }

        expect{subject.call_method(:post, {}, "/resource")}.to raise_error(StandardError, "fake body")
      end
    end

    it "should do validation and call method" do
      it_should_do_validation_and_call_method(:_get, :get)
      it_should_do_validation_and_call_method(:_post, :post)
      it_should_do_validation_and_call_method(:_put, :put)
      it_should_do_validation_and_call_method(:_delete, :delete)
    end

    # Helpers
    def it_should_do_validation_and_call_method(def_name, method)
      expect(subject).to receive(:doValidation)

      jsonable = double(to_json: "{}")
      uri = "/RelativeUri.aspx"

      expect(subject).to receive(method).with(uri, body: "{}", headers: subject.header) { fake_data }
      subject.send(def_name, uri, jsonable)
    end
  end
end