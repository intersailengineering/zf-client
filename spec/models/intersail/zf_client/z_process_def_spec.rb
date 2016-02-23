require 'rails_helper'

module Intersail
  module ZfClient
    describe ZProcessDef, type: :model do
      subject { build(:process_def) }
      it_should_behave_like "default_zero", [:id]

      it "should behave as a ZUser" do
        expect(subject).to have_attr_accessor(:id)
        expect(subject).to have_attr_accessor(:name)
        expect(subject).to have_attr_accessor(:ignore_history)
        expect(subject).to have_attr_accessor(:app_domain)
        expect(subject).to have_attr_accessor(:activities)
        expect(subject).to have_attr_accessor(:transitions)
        expect(subject).to have_attr_accessor(:properties)
        expect(subject).to have_attr_accessor(:permissions)
        expect(subject).to have_attr_accessor(:trigger_defs)
      end

      it "should be an active model" do
        expect(subject).to includes(ActiveModel::Model)
      end

      it "should validate his data" do
        expect(subject).to validate_presence_of(:name)
        expect(subject).to validate_presence_of(:app_domain)
        expect(subject).to validate_exclusion_of(:ignore_history).in_array([nil])
      end

      context "serialization" do
        it_should_behave_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "id" => nil,
              "name" => "",
              "app_domain" => "",
              "ignore_history" => false,
              "activities" => [],
              "transitions" => [],
              "properties" => [],
              "permissions" => [],
              "trigger_defs" => []
          }
        end

        it "should include activities, transitions and properties" do
          expect(subject.attributes_to_include).to be == [:activities, :transitions, :properties]
        end

        it "is buildable_from_hash" do
          expect(subject).to be_buildable_from_hash
        end
      end
    end
  end
end