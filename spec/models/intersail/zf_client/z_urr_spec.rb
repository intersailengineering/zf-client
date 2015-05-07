require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUrr, type: :model do
      subject { build(:urr) }

      it_behaves_like "urr"

      context "infoable" do
        it_behaves_like "infoable"

        it "should have given infoable attributes" do
          expect(subject.infoable_attributes).to be == [:unit, :role, :resource]
        end
      end

      context "serialization" do
        it_behaves_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "unit_id" => nil,
              "role_id" => nil,
              "resource_id" => nil
          }
        end

        it "should use id fields from has when resources are not given" do
          fake_hash = {
              "id" => Faker::Number.digit,
              "unit_id" =>  Faker::Number.digit,
              "role_id" =>  Faker::Number.digit,
              "resource_id" =>  Faker::Number.digit
          }

          urr = ZUrr.from_hash(fake_hash)

          expect(urr.id).to be == fake_hash["id"]
          expect(urr.unit_id).to be == fake_hash["unit_id"]
          expect(urr.role_id).to be == fake_hash["role_id"]
          expect(urr.resource_id).to be == fake_hash["resource_id"]
        end

        it "should ask role and units to be built from_hash" do
          fake_hash = {
              "id" => Faker::Number.digit,
              "unit" =>  {},
              "role" =>  {},
              "resource" =>  {"urrs" => []}
          }
          resource = ZResource.new fake_hash["resource"]
          unit = ZUnit.new fake_hash["unit"]
          role = ZRole.new fake_hash["role"]

          urr = ZUrr.from_hash(fake_hash)

          expect(urr.id).to be == fake_hash["id"]
          expect(urr.unit.as_json).to be == unit.as_json
          expect(urr.role.as_json).to be == role.as_json
          expect(urr.resource.as_json).to be == resource.as_json
        end
      end
    end
  end
end