require 'rails_helper'

module Intersail
  module ZfClient
    describe ZResource, type: :model do
      subject { build(:user_resource) }

      it_behaves_like "user_resource"

      context "serialization" do
        it_behaves_like "serializable"

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

        it "should include custom data" do
          expect(subject.attributes_to_include).to be == [:urrs]
        end
        it { is_expected.to be_buildable_from_hash }
      end
    end
  end
end