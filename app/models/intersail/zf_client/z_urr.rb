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

      # Validation
      validates_presence_of :role
      validates_presence_of :user
      validates_presence_of :unit
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :role
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :user
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :unit

      # Serialization
      def attributes
        {
            "role" => [],
            "resource" => [],
            "unit" => []
        }
      end

      def attributes_to_include
        [:role, :user, :unit]
      end
    end
  end
end