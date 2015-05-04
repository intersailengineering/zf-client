require 'rails_helper'

module Intersail
  describe 'InfoAble', focus: true do
    class InfoableItem
      include Infoable

      attr_accessor :an_attribute

      def infoable_attributes
        [
            :an_attribute
        ]
      end
    end


    # extract to mixin to use for all the infoable!
    context "should be infoable" do
      subject {InfoableItem.new}
        it {is_expected.to extends(Infoable)}
        it {is_expected.to extends(ActiveModel::Model)}
        it {is_expected.to respond_to(:infoable_attributes)}
    end

    let(:infoable) { InfoableItem.new }

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
        pending "do the resource_id method first"
        expect(infoable.data_attributes).to be == {an_attribute_id: 1}
      end

      xit "should return the id field of an attribute when accessing the attribute_id field"
    end

    context "is not an info object" do
      let(:infoable) { InfoableItem.new(an_attribute: OpenStruct.new(id: 1)) }

      it "should tell that is not an info object with is_info?" do
        expect(infoable.is_info?).to be_falsey
      end
      xit "should pass resource data with data_attributes"

      xit "should return the id field of an attribute when accessing the attribute_id field"
    end

  end
end