module Intersail
  shared_examples "serializable" do
    let(:_serializable) { subject }

    it "should ask at ActiveModel:Serializer::JSON for serialization with as_json" do
      allow(_serializable).to receive(:valid?) { true }
      expect(_serializable).to extends(ActiveModel::Serializers::JSON)
      expect_any_instance_of(ActiveModel::Serializers::JSON).to receive(:as_json)

      _serializable.as_json
    end

    it "should not serialize inself if not valid" do
      expect(_serializable).to receive(:valid?) {false}

      expect(_serializable.as_json).to be_nil
    end

    context "subattributes" do
      it "should include attributes_to_include" do
        expect_any_instance_of(ActiveModel::Serializers::JSON).to receive(:serializable_hash)
          .with({include: _serializable.attributes_to_include})

        _serializable.serializable_hash
      end

      it "should implement attributes_to_include" do
        expect(_serializable).to respond_to :attributes_to_include
      end

      class SerializableStub
        include Serializable
      end

      it "should check if attributes_to_include method is defined" do
        expect{SerializableStub.new.serializable_hash}.to raise_error(StandardError, "You need to define attributes_to_include method")
      end
    end
  end
end
