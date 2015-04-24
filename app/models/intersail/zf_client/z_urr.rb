module Intersail
  module ZfClient
    class ZUrr

      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      attr_accessor :role
      attr_accessor :resource

      # Validation
      validates_presence_of :role
      validates_presence_of :resource
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :role
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :resource

      # Serialization
      def attributes
        {
            "role" => [],
            "resource" => []
        }
      end

      def attributes_to_include
        [:role, :resource]
      end
    end
  end
end