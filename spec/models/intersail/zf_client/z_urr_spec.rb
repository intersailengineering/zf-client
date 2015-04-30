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
            "unit_id" => nil,
            "role_id" => nil,
            "resource_id" => nil
          }
        end
      end
    end
  end
end