require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUnit, type: :model do
      subject { build(:unit) }

      it_behaves_like "unit"

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
              "id" => nil,
              "name" => "",
              "description" => "",
              "parent_id" => nil
          }
        end

        it "should serialize parent_id" do
          expect(subject.as_json["parent_id"]).to be == subject.parent.id

          expect(build(:unit_no_parent).as_json["parent_id"]).to be_nil
        end

        it_behaves_like "nested_resourceable"
      end
    end
  end
end