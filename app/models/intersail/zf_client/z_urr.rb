module Intersail
  module ZfClient
    class ZUrr
      include ActiveModel::Model
      include Serializable
      include Infoable

      # Attributes
      attr_accessor :id
      # class attributes
      attr_accessor :unit
      attr_accessor :role
      attr_accessor :resource

      # Validation
      # validates presence of either class param or class_id
      validates_presence_of :unit_id
      validates_presence_of :role_id
      validates_presence_of :resource_id

      # Info object handling
      def infoable_attributes
        [:unit, :role, :resource]
      end

      # Serialization
      def attributes
        {
            "unit_id" => nil,
            "role_id" => nil,
            "resource_id" => nil
        }
      end

      def attributes_to_include
        []
      end
    end
  end
end