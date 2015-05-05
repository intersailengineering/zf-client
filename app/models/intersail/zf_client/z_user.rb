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

      # Validations
      validates_presence_of :username
      validates :active, exclusion: { in: [nil] }
      validates_presence_of :resource
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :resource

      # Delegation
      delegate :urrs, to: :resource

      # Serialization
      def attributes
        {
            "username" => "",
            "description" => "",
            "password" => nil,
            "active" => false,
            "resource" => nil
        }
      end

      def attributes_to_include
        [:resource]
      end
    end
  end
end