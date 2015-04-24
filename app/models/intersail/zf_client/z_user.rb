module Intersail
  module ZfClient
    class ZUser

      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      attr_accessor :username
      attr_accessor :description
      attr_accessor :password
      attr_accessor :active
      attr_accessor :info

      # Validations
      validates_presence_of :username
      validates_presence_of :description
      validates_presence_of :password
      validates_presence_of :active
      validates_presence_of :info
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :info

      # Serialization
      def attributes
        {
            "username" => "",
            "description" => "",
            "password" => "",
            "active" => false,
            "info" => nil
        }
      end

      def attributes_to_include
        [:info]
      end
    end
  end
end