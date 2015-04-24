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
      attr_accessor :resource
      attr_accessor :profile

      # Validations
      validates_presence_of :username
      validates_presence_of :description
      validates_presence_of :password
      validates_presence_of :active
      validates_presence_of :resource
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :resource
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :profile

      # Serialization
      def attributes
        {
            "username" => "",
            "description" => "",
            "password" => "",
            "active" => false,
            "resource" => nil,
            "profile" => []
        }
      end

      def attributes_to_include
        [:resource]
      end
    end
  end
end