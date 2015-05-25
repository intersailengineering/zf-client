require 'rails_helper'

module Intersail
  describe 'DefaultZeroId', type: :module do
    class DefaultZeroIdStub
      include DefaultZeroId

      attr_accessor :id
      attr_accessor :name

      def zero_attributes
        [:id, :name]
      end
    end

    subject {DefaultZeroIdStub.new}

    it_should_behave_like "default_zero", [:id]

    it "should return id 0 if falsey" do
      subject.id = nil
      expect(subject.id).to be == 0

      subject.name = nil
      expect(subject.name).to be == 0
    end

    it "should return id if not nil" do
      subject.id = 2
      expect(subject.id).to be == 2

      subject.name = 2
      expect(subject.name).to be == 2
    end
  end
end