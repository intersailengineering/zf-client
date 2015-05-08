require 'rails_helper'

module Intersail
  module ZfClient
    describe ZActivityDef, type: :model do
      subject { build(:activity_def) }
      it_should_behave_like "default_zero", [:id]

      it "should behave as a ZUser" do
        expect(subject).to have_attr_accessor(:id)
        expect(subject).to have_attr_accessor(:name)
        expect(subject).to have_attr_accessor(:type)
        expect(subject).to have_attr_accessor(:in_param_string)
        expect(subject).to have_attr_accessor(:manager)
        expect(subject).to have_attr_accessor(:process_result)
        expect(subject).to have_attr_accessor(:process_definition_id)
        expect(subject).to have_attr_accessor(:enabled)
      end

      it "should be an active model" do
        expect(subject).to includes(ActiveModel::Model)
      end

      it "should validate his data" do
        expect(subject).to validate_presence_of(:name)
        expect(subject).to validate_presence_of(:type)
        expect(subject).to validate_presence_of(:process_definition_id)
        expect(subject).to validate_exclusion_of(:enabled).in_array([nil])
      end

      context "serialization" do
         it_should_behave_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "id" => nil,
              "name" => "",
              "type" => 0,
              "in_param_string" => nil,
              "manager" => nil,
              "process_result" => 0,
              "process_definition_id" => 0,
              "enabled" => false
          }
        end

        it "should include resource and urrs" do
          expect(subject.attributes_to_include).to be == []
        end

        it { is_expected.to be_buildable_from_hash }
      end
    end
  end
end