require 'rails_helper'

module Intersail
  module ZfClient
    describe ZProcessInstance, type: :model do
      subject { build(:z_process_inst) }

      it_behaves_like "process_instance"

      context "serialization" do
        it_behaves_like "serializable"

        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "process_def_id" => 0,
              "parent_process_id" => 0,
              "name" => "",
              "description" => "",
              "properties" => {}
          }
        end

        it "should include properties" do
          expect(subject.attributes_to_include).to be == []
        end
        it { is_expected.to be_buildable_from_hash }
      end
    end
  end
end
