module Intersail
  shared_examples "process_definition" do
    let(:_p_def) { subject }

    it "should have process definition attributes" do
      expect(_p_def).to have_attr_accessor(:process_def_id)
      expect(_p_def).to have_attr_accessor(:name)
      expect(_p_def).to have_attr_accessor(:description)
      expect(_p_def).to have_attr_accessor(:properties)
    end

    it "should be an active model" do
      expect(_p_def).to extends(ActiveModel::Model)
    end

    it "should validate his attributes" do
      expect(_p_def).to validate_presence_of(:process_def_id)
      expect(_p_def).to validate_presence_of(:name)
      expect(_p_def).to validate_presence_of(:description)
      expect(_p_def).to validate_presence_of(:properties)
    end

    it "should ask his property if it's valid" do
      d_invalid = double()
      expect(d_invalid).to receive(:valid?) { false }
      expect(d_invalid).to receive_message_chain(:errors, :full_message) { "Fake error message" }

      _p_def.properties = [d_invalid]
      expect(_p_def.valid?).to be == false
    end

    it "should be serialized with as_json" do
      expect(_p_def).to extends(ActiveModel::Serializers::JSON)
      allow(_p_def).to receive(:valid?) { true }

      expect(_p_def.as_json).to be == {
          'ProcessDefId' => _p_def.process_def_id,
          'Name' => _p_def.name,
          'Description' => _p_def.description,
          'Properties' => _p_def.properties.as_json
      }
    end

    it "should not serialize inself if not valid" do
      expect(_p_def).to receive(:valid?) {false}

      expect(_p_def.as_json).to be_nil
    end
  end
end