module Intersail
  module ZfClient
    class ZUrr
      include Serializable
      include DefaultZeroId
      include Infoable

      # Attributes
      # class attributes
      attr_accessor :id
      attr_accessor :unit
      attr_accessor :role
      attr_accessor :resource
      # To destroy an urr when passed from users
      attr_accessor :_destroy
      # Attributes that default to 0
      def zero_attributes
        [:id, :_destroy]
      end
      # Validation
      # validates presence of either class param or class_id
      validates_presence_of :unit_id
      validates_presence_of :role_id
      validates_presence_of :resource_id


      # Info object handling
      def infoable_attributes
        [:unit, :role, :resource]
      end

      # Serialization
      def attributes
        {
            "id" => nil,
            "unit_id" => nil,
            "role_id" => nil,
            "resource_id" => nil,
            "_destroy" => nil
        }
      end

      def attributes_to_include
        []
      end

      class << self
        def from_hash(hash)
          hash = hash.clone
          hash["unit"] = Intersail::ZfClient::ZUnit.from_hash(hash["unit"]) if hash["unit"]
          hash["role"] = Intersail::ZfClient::ZRole.from_hash(hash["role"]) if hash["role"]
          hash["resource"] = Intersail::ZfClient::ZResource.from_hash(hash["resource"]) if hash["resource"]
          Intersail::ZfClient::ZUrr.new hash
        end
      end
    end
  end
end