require 'rails_helper'

module Intersail
  module Validators
    describe SubAttributeValidator, type: :validator do
      class StubToValidate
        include ActiveModel::Validations

        attr_accessor :sub_attr

        validates_with Intersail::Validators::SubAttributeValidator, attributes: :sub_attr
      end

      before(:all) do
        @stub = StubToValidate.new
      end

      it "should skip empty data" do
        expect(@stub.valid?).to be == true
      end

      context "success" do

        it "should validate a single subattribute" do
          @stub.sub_attr = double(valid?: true)
          expect(@stub.valid?).to be == true
        end

        it "should validate all subattributes" do
          @stub.sub_attr = [double(valid?: true), double(valid?: true)]
          expect(@stub.valid?).to be == true
        end

      end

      context "error" do
        it "should set error if the subattribute is invalid" do
          error_double = double("error")
          expect(error_double).to receive(:valid?) { false }
          expect(error_double).to receive_message_chain(:errors, :full_message) { ["Fake error message"] }
          @stub.sub_attr = error_double

          expect(@stub.valid?).to be == false
          expect(@stub.errors.full_messages_for :sub_attr).to be == ["Sub attr [\"Fake error message\"]"]
        end

        it "should set error if any of the subattributes are invalid" do
          error_double = double("error")
          expect(error_double).to receive(:valid?) { false }
          expect(error_double).to receive_message_chain(:errors, :full_message) { ["Fake error message"] }
          @stub.sub_attr = [double(valid?: true), error_double]

          expect(@stub.valid?).to be == false
          expect(@stub.errors.full_messages_for :sub_attr).to be == ["Sub attr [\"Fake error message\"]"]
        end
      end
    end
  end
end