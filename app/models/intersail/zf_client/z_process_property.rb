module Intersail
  module ZfClient
    class ZProcessProperty
      include ActiveModel::Model
      include ActiveModel::Serializers::JSON

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
            "value" => ""
        }
      end
    end
  end
end