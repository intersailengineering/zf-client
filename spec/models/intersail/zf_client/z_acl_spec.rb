require 'rails_helper'

module Intersail
  module ZfClient
    describe ZAcl, type: :model do
      subject { build(:acl) }

      it_should_behave_like "acl"

      context "serialization" do
        it_should_behave_like "serializable"

        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
            "id" => nil,
            "process_def_id" => 0,
            "activity_def_id" => 0,
            "unit_id" => "",
            "role_id" => "",
            "resource_id" => "",
            "permission_str" => "",
            "priority" => 0,
            "inherit_unit" => false,
            "inherit_role" => false,
            "mandatory" => true,
            "enabled" => false
          }
        end

        it "should include nothing" do
          expect(subject.attributes_to_include).to be == []
        end

        it { is_expected.to be_buildable_from_hash }
      end
    end
  end
end
