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
      attr_accessor :urrs

      # Validations
      validates_presence_of :username
      validates_presence_of :password
      validates :active, exclusion: { in: [nil] }
      validates_presence_of :resource
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :resource
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :urrs

      # Serialization
      def attributes
        {
            "username" => "",
            "description" => "",
            "password" => nil,
            "active" => false,
            "resource" => nil,
            "urrs" => []
        }
      end

      def attributes_to_include
        [:resource, :urrs]
      end
    end
  end
end