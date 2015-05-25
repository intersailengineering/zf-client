require 'rails_helper'

module Intersail
  describe 'InfoAble', type: :module do
    class InfoableItem
      include Infoable

      attr_accessor :an_attribute_a
      attr_accessor :an_attribute_b

      def infoable_attributes
        [:an_attribute_a, :an_attribute_b]
      end
    end

    let(:infoable) { InfoableItem.new }
    subject {infoable}

    it_should_behave_like "infoable"

    it "should have empty infoable attributes as default" do
      class InfoableEmptyItem
        include Infoable
      end

      expect(InfoableEmptyItem.new.infoable_attributes).to be == []
    end

    it "can be created from the id attributes" do
      expect(subject.class.new(an_attribute_a_id: 1).an_attribute_a_id).to be == 1
    end

    it "should return nil if attribute and attribute_id are nil" do
      expect(infoable.an_attribute_a_id).to be_nil
    end

    it "should create attr_accessor for the info id fields" do
      attributes = infoable.infoable_attributes
      attributes.each do |name, value|
        expect(infoable).to have_attr_accessor("#{name}_id")
      end
    end

    it "should check for single attribute with is_info?(attribute_name)" do
      infoable.an_attribute_a = OpenStruct.new
      expect(infoable.is_info?(:an_attribute_a)).to be_falsey
    end

    context "is an info object" do
      let(:infoable) { InfoableItem.new(an_attribute_a_id: 1, an_attribute_b_id: 2) }

      it "should tell that is an info object with is_info?" do
        expect(infoable.is_info?).to be_truthy
      end

      it "should pass info data with data_attributes" do
        expect(infoable.data_attributes).to be == {an_attribute_a_id: 1, an_attribute_b_id: 2}
      end

      it "should return the id field of an attribute when accessing the attribute_id field" do
        expect(infoable.an_attribute_a_id).to be == 1
      end
    end

    context "is not an info object" do
      let(:attribute_a) { OpenStruct.new(id: 1) }
      let(:attribute_b) { OpenStruct.new(id: 2) }
      let(:attribute_b_id) { 2 }
      let(:infoable) { InfoableItem.new(an_attribute_a: attribute_a, an_attribute_b_id: attribute_b_id) }

      it "should tell that is not an info object with is_info?" do
        infoable.an_attribute_b = attribute_b
        expect(infoable.is_info?).to be_falsey
      end

      it "should pass resource data with data_attributes" do
        expect(infoable.data_attributes).to be == {an_attribute_a: attribute_a, an_attribute_b_id: attribute_b_id}
      end

      it "should return the id field of an attribute when accessing the attribute_id field" do
        expect(infoable.an_attribute_a_id).to be == 1
        expect(infoable.an_attribute_b_id).to be == 2
      end

      it "should fetch resource id if attribute_id is 0" do
        infoable.an_attribute_b_id = 0
        infoable.an_attribute_b = attribute_b
        expect(infoable.an_attribute_b_id).to be == 2
      end
    end

    context "interaction with default_zero_id" do
      class InfoableZeroItem < InfoableItem
        include DefaultZeroId

        def zero_attributes
          [:an_attribute_b_id]
        end
      end
      let(:attribute_a) { OpenStruct.new(id: 1) }
      let(:attribute_b) { OpenStruct.new(id: nil) }
      let(:attribute_a_id) { 1 }
      let(:attribute_b_id) { nil }

      context "is not an info object" do
        let(:infoable_zero) { InfoableZeroItem.new(an_attribute_a_id: attribute_a_id, an_attribute_b_id: attribute_b_id) }
        it "should return 0" do
          expect(infoable_zero.an_attribute_a_id).to be == 1
          expect(infoable_zero.an_attribute_b_id).to be == 0
        end
      end

      context "is an info object" do
        let(:infoable_zero) { InfoableZeroItem.new(an_attribute_a: attribute_a, an_attribute_b: attribute_b) }

        it "should return 0" do
          expect(infoable_zero.an_attribute_a_id).to be == 1
          expect(infoable_zero.an_attribute_b_id).to be == 0
        end
      end
    end
  end
end