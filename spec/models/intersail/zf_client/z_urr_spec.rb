require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUrr, type: :model do
      subject { @urr = build(:urr) }

      it_behaves_like "urr"

      context "serialization" do
        it_behaves_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
            "role" => [],
            "resource" => []
          }
        end

        it "should include role and resource" do
          expect(subject.attributes_to_include).to be == [:role, :resource]
        end
      end
    end
  end
end