module Intersail
  module ZfClient
    class ZCustomData

      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :name
      attr_accessor :value

      # Validation
      validates_presence_of :name
      validates_presence_of :value

      # Serialization
      def attributes
        {
            "name" => "",
            "value" => "",
        }
      end

      # No special attributes to include
      def attributes_to_include
        []
      end
    end
  end
end