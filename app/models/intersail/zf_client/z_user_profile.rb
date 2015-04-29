module Intersail
  module ZfClient
    class ZUserProfile
      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      attr_accessor :first_name
      attr_accessor :last_name
      attr_accessor :mail
      attr_accessor :custom_data

      # Validation
      validates_presence_of :first_name
      validates_presence_of :last_name
      validates_presence_of :mail

      # Serialization
      def attributes
        {
            "first_name" => "",
            "last_name" => "",
            "mail" => "",
            "custom_data" => ""
        }
      end

      def attributes_to_include
        [:custom_data]
      end
    end
  end
end