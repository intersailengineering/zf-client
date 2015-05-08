require 'rails_helper'

module Intersail
  shared_examples "tree_resource" do
    context "attributes" do
      it_should_behave_like "default_zero", [:id]
      it { is_expected.to have_attr_accessor(:id) }
      it { is_expected.to have_attr_accessor(:name) }
      it { is_expected.to have_attr_accessor(:description) }
      it { is_expected.to have_attr_accessor(:parent) }

      it { is_expected.to includes(ActiveModel::Model) }
    end

    context "validation" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to have_subattribute_validator(:parent) }
    end

    context "infoable" do
      it_should_behave_like "infoable"

      it "should have given infoable attributes" do
        expect(subject.infoable_attributes).to be == [:parent]
      end
    end

    context "serialization" do
      it_should_behave_like "serializable"
      it "should have serialization attributes" do
        expect(subject.attributes).to be == {
            "id" => nil,
            "name" => "",
            "description" => "",
            "parent_id" => nil
        }
      end

      it "should serialize parent_id" do
        expect(subject.as_json["parent_id"]).to be == subject.parent.id

        expect(build(:unit_no_parent).as_json["parent_id"]).to be_nil
      end

      it_should_behave_like "nested_resourceable"
    end
  end
end

