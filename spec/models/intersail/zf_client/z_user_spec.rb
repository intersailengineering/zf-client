require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUser, type: :model do
      subject { build(:user) }

      it_should_behave_like "default_zero", [:id]
      it "should behave as a ZUser" do
        expect(subject).to have_attr_accessor(:username)
        expect(subject).to have_attr_accessor(:description)
        expect(subject).to have_attr_accessor(:password)
        expect(subject).to have_attr_accessor(:active)
        expect(subject).to have_attr_accessor(:resource)
        expect(subject).to have_attr_accessor(:metadata)
        expect(subject).to_not have_attr_accessor(:urrs)
      end

      it "should be an active model" do
        expect(subject).to includes(ActiveModel::Model)
      end

      it "validates his data" do
        expect(subject).to validate_presence_of(:username)
        expect(subject).to validate_exclusion_of(:active).in_array([nil])
        expect(subject).to validate_presence_of(:resource)
        expect(subject).to have_subattribute_validator(:resource)
        expect(subject).to_not have_subattribute_validator(:urrs)
      end

      context "delegation" do
        it {is_expected.to delegates(:first_name, :resource)}
        it {is_expected.to delegates(:last_name, :resource)}
        it {is_expected.to delegates(:mail, :resource)}
        it {is_expected.to delegates(:custom_data, :resource)}
        it {is_expected.to delegates(:urrs, :resource)}
      end

      context "serialization" do
        it_should_behave_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "id" => nil,
              "username" => "",
              "description" => "",
              "active" => false,
              "resource" => nil,
              "metadata" => {}
          }
        end

        it "should include resource and urrs" do
          expect(subject.attributes_to_include).to be == [:resource]
        end

        it { is_expected.to be_buildable_from_hash }
      end
    end
  end
end