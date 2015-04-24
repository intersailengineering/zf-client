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
      attr_accessor :profile
      attr_accessor :urr

      # Validations
      validates_presence_of :username
      validates_presence_of :description
      validates_presence_of :password
      validates_presence_of :active
      validates_presence_of :profile
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :profile
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :urr

      # Serialization
      def attributes
        {
            "username" => "",
            "description" => "",
            "password" => "",
            "active" => false,
            "profile" => nil,
            "urr" => []
        }
      end

      def attributes_to_include
        [:profile, :urr]
      end
    end
  end
end