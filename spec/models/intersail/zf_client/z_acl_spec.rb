require 'rails_helper'

module Intersail
  module ZfClient
    describe ZAcl, type: :model do
      subject { build(:acl) }

      it_behaves_like "acl"

      context "serialization" do
        it_behaves_like "serializable"

        it "should have serialization attributes" do
          pending "fix acl model"
          expect(subject.attributes).to be == {
            "process_def_id" => 0,
            "activity_def_id" => 0,
            "unit_id" => "",
            "role_id" => "",
            "resource_id" => "",
            "permission" => "",
            "priority" => 0,
            "inherit_unit" => false,
            "inherit_role" => false,
            "mandatory" => true,
            "enabled" => false
          }
        end

        it "should include properties" do
          expect(subject.attributes_to_include).to be == []
        end
      end
    end
  end
end
