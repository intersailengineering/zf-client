module Intersail
  module ZfClient
    class ZProcessProperty
      include ActiveModel::Model
      include ActiveModel::Serializers::JSON

      attr_accessor :name
      attr_accessor :value

      validates_presence_of :name
      validates_presence_of :value

      def attributes
        {
            "name" => "",
            "value" => ""
        }
      end
    end
  end
end