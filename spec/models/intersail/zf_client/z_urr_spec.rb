require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUrr, type: :model do
      subject { build(:urr) }

      it_behaves_like "urr"

      context "serialization" do
        it_behaves_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
            "role_id" => nil,
            "user_id" => nil,
            "unit_id" => nil
          }
        end
      end
    end
  end
end