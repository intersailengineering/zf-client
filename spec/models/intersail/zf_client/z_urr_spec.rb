require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUrr, type: :model do
      subject { @urr = build(:urr) }

      it_behaves_like "urr"

      context "serialization" do
        # it_behaves_like "serializable"
        xit "should have serialization attributes" do
          expect(subject.attributes).to be == {

          }
        end
      end
    end
  end
end