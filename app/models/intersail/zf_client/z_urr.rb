module Intersail
  module ZfClient
    class ZUrr

      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      attr_accessor :role
      attr_accessor :user
      attr_accessor :unit
      #@jtodoIMP add user,role and unit id for create req

      # Validation
      validates_presence_of :role
      validates_presence_of :user
      validates_presence_of :unit
      # Here we does not validate user,role and resource subattributes to avoid infinite loop
      # and to allow use of just ids for creation

      # Serialization
      def attributes
        {
            "role_id" => nil,
            "user_id" => nil,
            "unit_id" => nil
        }
      end

      def role_id
        return self.role.id if self.role && self.role.id != nil
        nil
      end

      def user_id
        return self.user.id if self.user && self.user.id != nil
        nil
      end

      def unit_id
        return self.unit.id if self.unit && self.unit.id != nil
        nil
      end

      def attributes_to_include
        []
      end
    end
  end
end