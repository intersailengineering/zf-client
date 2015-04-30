module Intersail
  module ZfClient
    class ZUrr

      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      # class attributes
      attr_accessor :unit
      attr_accessor :role
      attr_accessor :resource
      # id attributes
      attr_accessor :unit_id
      attr_accessor :role_id
      attr_accessor :resource_id

      # Validation
      # validates presence of either class param or class_id
      validates_presence_of :unit_id
      validates_presence_of :role_id
      validates_presence_of :resource_id

      # Serialization
      def attributes
        {
            "unit_id" => nil,
            "role_id" => nil,
            "resource_id" => nil
        }
      end

      def unit_id
        @unit_id || self.unit && self.unit.id
      end

      def role_id
        @role_id || self.role && self.role.id
      end

      def resource_id
        @resource_id || self.resource && self.resource.id
      end

      def attributes_to_include
        []
      end
    end
  end
end