require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUnit, type: :model do
      subject { build(:unit) }

      it_behaves_like "unit"

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

          expect(build(:unit_no_parent).as_json["parent_id"]).to be_nil
        end

        it "should include nothing" do
          expect(subject.attributes_to_include).to be == []
        end
      end
    end
  end
end