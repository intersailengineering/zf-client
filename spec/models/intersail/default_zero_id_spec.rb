require 'rails_helper'

module Intersail
  describe 'DefaultZeroId', type: :module do
    class DefaultZeroIdStub
      include DefaultZeroId
    end

    subject {DefaultZeroIdStub.new}

    it_behaves_like "default_zero_idable"

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