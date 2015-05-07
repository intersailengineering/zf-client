require 'rails_helper'

module Intersail
  module ZfClient
    describe ZRole, type: :model do
      subject { build(:role) }

      it_behaves_like "role"

      context "infoable" do
        it_behaves_like "infoable"

        it "should have given infoable attributes" do
          expect(subject.infoable_attributes).to be == [:parent]
        end
      end

      context "serialization" do
        it_behaves_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "name" => "",
              "description" => "",
              "parent_id" => nil
          }
        end

        it "should serialize parent_id" do
          expect(subject.as_json["parent_id"]).to be == subject.parent.id

          expect(build(:role_no_parent).as_json["parent_id"]).to be_nil
        end

        it "should include nothing" do
          expect(subject.attributes_to_include).to be == []
        end

        it_behaves_like "nested_resourceable"
      end
    end
  end
end