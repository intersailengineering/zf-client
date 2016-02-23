require 'rails_helper'

module Intersail
  module ZfClient
    describe ZResource, type: :model do
      subject { build(:user_resource) }

      it_should_behave_like "user_resource"

      describe 'valid?' do
        it {is_expected.to validate_presence_of :urrs}
        it {is_expected.to validate_presence_of :mail}
      end

      context "serialization" do
        it_should_behave_like "serializable"

        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "id" => nil,
              "first_name" => "",
              "last_name" => "",
              "mail" => "",
              "custom_data" => {},
              "urrs" => []
          }
        end

        context "urrs" do
          it "should return empty array if urrs is nil" do
            expect(subject.class.new.urrs).to be == []
          end
        end

        it "should include urrs" do
          expect(subject.attributes_to_include).to be == [:urrs]
        end
        it { is_expected.to be_buildable_from_hash }
      end
    end
  end
end