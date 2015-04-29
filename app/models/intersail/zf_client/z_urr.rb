module Intersail
  module ZfClient
    class ZUrr

      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      # class attributes
      attr_accessor :role
      attr_accessor :user
      attr_accessor :unit
      # id attributes
      attr_accessor :role_id
      attr_accessor :user_id
      attr_accessor :unit_id

      # Validation
      # validates presence of either class param or class_id
      validates_presence_of :role
      validates_presence_of :user
      validates_presence_of :unit

      # Serialization
      def attributes
        {
            "role_id" => nil,
            "user_id" => nil,
            "unit_id" => nil
        }
      end

      def role_id
        @role_id || self.role.id
      end

      def user_id
        @user_id || self.user.id
      end

      def unit_id
        @unit_id || self.unit.id
      end

      def attributes_to_include
        []
      end
    end
  end
end