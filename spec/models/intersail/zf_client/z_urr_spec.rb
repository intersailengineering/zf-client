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

        it "should include role_id" do
          expect(subject.as_json["role_id"]).to be == subject.role.id
        end

        it "should include user_id" do
          expect(subject.as_json["user_id"]).to be == subject.user.id
        end

        it "should include unit_id" do
          expect(subject.as_json["unit_id"]).to be == subject.unit.id
        end

        it "should include nothing as subresource" do
          expect(subject.attributes_to_include).to be == []
        end
      end
    end
  end
end