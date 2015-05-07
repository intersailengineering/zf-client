require 'rails_helper'

module Intersail
  describe 'SerializeId', type: :module do
    class SerializeIdStub
      include SerializeId
    end

    subject {SerializeIdStub.new}

    it_behaves_like "serialize_idable"

    it "should return id 0 if falsey" do
      subject.id = nil
      expect(subject.id).to be == 0
    end

    it "should return id if not nil" do
      subject.id = 2
      expect(subject.id).to be == 2
    end
  end
end