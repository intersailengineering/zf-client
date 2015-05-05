module Intersail
  module ZfClient
    class ZResource
      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      attr_accessor :first_name
      attr_accessor :last_name
      attr_accessor :mail
      attr_accessor :custom_data
      # contain an array of ZUrr items
      attr_accessor :urrs

      # Validation
      validates_presence_of :first_name
      validates_presence_of :last_name
      validates_presence_of :mail
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :urrs

      # Serialization
      def attributes
        {
            "first_name" => "",
            "last_name" => "",
            "mail" => "",
            "custom_data" => {},
            "urrs" => []
        }
      end

      def attributes_to_include
        [:urrs]
      end
    end
  end
end