require 'rails_helper'

module Intersail
  describe 'InfoAble' do
    class InfoableItem
      include Infoable

      attr_accessor :an_attribute

      def infoable_attributes
        [:an_attribute]
      end
    end

    let(:infoable) { InfoableItem.new }
    subject {infoable}

    it_behaves_like "infoable"

    it "can be created from the id attributes" do
      expect(subject.class.new(an_attribute_id: 1).an_attribute_id).to be == 1
    end

    it "should return nil if attribute and attribute_id are nil" do
      expect(infoable.an_attribute_id).to be_nil
    end

    it "should create attr_accessor for the info id fields" do
      attributes = infoable.infoable_attributes
      attributes.each do |name, value|
        expect(infoable).to have_attr_accessor("#{name}_id")
      end
    end

    context "is an info object" do
      let(:infoable) { InfoableItem.new(an_attribute_id: 1) }

      it "should tell that is an info object with is_info?" do
        expect(infoable.is_info?).to be_truthy
      end

      it "should pass info data with data_attributes" do
        expect(infoable.data_attributes).to be == {an_attribute_id: 1}
      end

      it "should return the id field of an attribute when accessing the attribute_id field" do
        expect(infoable.an_attribute_id).to be == 1
      end
    end

    context "is not an info object" do
      let(:attribute) { OpenStruct.new(id: 1) }
      let(:infoable) { InfoableItem.new(an_attribute: attribute) }

      it "should tell that is not an info object with is_info?" do
        expect(infoable.is_info?).to be_falsey
      end

      it "should pass resource data with data_attributes" do
        expect(infoable.data_attributes).to be == {an_attribute: attribute}
      end

      it "should return the id field of an attribute when accessing the attribute_id field" do
        expect(infoable.an_attribute_id).to be == 1
      end
    end

  end
end