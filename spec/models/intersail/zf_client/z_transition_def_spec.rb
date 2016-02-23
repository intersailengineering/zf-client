require 'rails_helper'

module Intersail
  module ZfClient
    describe ZTransitionDef, type: :model do
      subject { build(:transition_def) }
      it_should_behave_like "default_zero", [:id]

      it "should behave as a ZTransition" do
        expect(subject).to have_attr_accessor(:id)
        expect(subject).to have_attr_accessor(:name)
        expect(subject).to have_attr_accessor(:activity_result)
        expect(subject).to have_attr_accessor(:rules)
        expect(subject).to have_attr_accessor(:manager)
        expect(subject).to have_attr_accessor(:priority)
        expect(subject).to have_attr_accessor(:start_activity_id)
        expect(subject).to have_attr_accessor(:end_activity_id)
        expect(subject).to have_attr_accessor(:process_definition_id)
        expect(subject).to have_attr_accessor(:user_change_required)
        expect(subject).to have_attr_accessor(:comment_title)
        expect(subject).to have_attr_accessor(:reverse_transition_id)
      end

      it "should be an active model" do
        expect(subject).to includes(ActiveModel::Model)
      end

      it "should validate his data" do
        expect(subject).to validate_presence_of(:name)
        expect(subject).to validate_presence_of(:activity_result)
        expect(subject).to validate_presence_of(:start_activity_id)
        expect(subject).to validate_presence_of(:end_activity_id)
        expect(subject).to validate_presence_of(:process_definition_id)
      end

      context "serialization" do
        it_should_behave_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "id" => nil,
              "name" => "",
              "activity_result" => 0,
              "rules" => "",
              "manager" => "",
              "priority" => 0,
              "start_activity_id" => 0,
              "end_activity_id" => 0,
              "process_definition_id" => 0,
              "user_change_required" => 0,
              "comment_title" => "",
              "reverse_transition_id" => 0
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