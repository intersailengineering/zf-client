require 'rails_helper'

module Intersail
  module ZfClient
    describe ZPropertyDef, type: :model do
      subject { build(:property_def) }
      it_should_behave_like "default_zero", [:id]

      it "should behave as a ZProperty" do
        expect(subject).to have_attr_accessor(:id)
        expect(subject).to have_attr_accessor(:name)
        expect(subject).to have_attr_accessor(:description)
        expect(subject).to have_attr_accessor(:type)
        expect(subject).to have_attr_accessor(:process_def_id)
        expect(subject).to have_attr_accessor(:default_value)
        expect(subject).to have_attr_accessor(:constraint_definition)
        expect(subject).to have_attr_accessor(:read_only)
        expect(subject).to have_attr_accessor(:internal_property)
      end

      it "should be an active model" do
        expect(subject).to includes(ActiveModel::Model)
      end

      it "should validate his data" do
        expect(subject).to validate_presence_of(:name)
        expect(subject).to validate_presence_of(:type)
        expect(subject).to validate_presence_of(:process_def_id)
      end

      context "serialization" do
        it_should_behave_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "id" => nil,
              "name" => "",
              "description" => "",
              "type" => 0,
              "process_def_id" => 0,
              "default_value" => "",
              "constraint_definition" => "",
              "read_only" => 0,
              "internal_property" => 0
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