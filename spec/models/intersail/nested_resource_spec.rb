require 'rails_helper'

module Intersail
  describe 'NestedResource', type: :module do
    class NestedResourceStub
      extend NestedResource
      include ActiveModel::Model

      attr_accessor :id
      attr_accessor :parent
      attr_accessor :name
      attr_accessor :description
    end

    subject {NestedResourceStub.new}

    it_should_behave_like "nested_resourceable"

    it "should be built recursively from hash" do
      fake_hierarchy = {
          "parent" => {
              "parent" => {
                  "parent" => {
                      "name" => "IZSLER",
                      "description" => "IZSLER",
                      "id" => 1
                  },
                  "name" => "BSE",
                  "description" => "Laboratori BSE",
                  "id" => 5
              },
              "name" => "Brescia",
              "description" => "Laboratorio BSE Brescia",
              "id" => 6
          },
          "name" => "Reparto proteomica",
          "description" => "Reparto proteomica",
          "id" => 21
      }

      built = subject.class.from_hash(fake_hierarchy)

      expect(built.id).to be == 21
      expect(built.parent.id).to be == 6
      expect(built.parent.parent.id).to be == 5
      expect(built.parent.parent.parent.id).to be == 1
      expect(built.parent.parent.parent.parent).to be == nil
    end
  end
end