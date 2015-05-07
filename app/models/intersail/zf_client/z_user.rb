module Intersail
  module ZfClient
    class ZUser

      include ActiveModel::Model
      include Serializable
      include DefaultZeroId

      # Attributes
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

      # Serialization
      def attributes
        {
            "id" => nil,
            "username" => "",
            "description" => "",
            "active" => false,
            "resource" => nil
        }
      end

      def attributes_to_include
        [:resource]
      end

      def self.from_hash(h)
        hash = h.clone
        hash["resource"] = ZResource.from_hash(hash["resource"])
        ZUser.new hash
      end
    end
  end
end