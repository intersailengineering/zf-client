module Intersail
  module ZfClient
    class ZUrr
      include Serializable
      include Infoable
      include DefaultZeroId

      # Attributes
      # class attributes
      attr_accessor :unit
      attr_accessor :role
      attr_accessor :resource

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
            "resource_id" => nil
        }
      end

      def attributes_to_include
        []
      end

      def self.from_hash(hash)
        hash = hash.clone
        hash["unit"] = ZUnit.from_hash(hash["unit"]) if hash["unit"]
        hash["role"] = ZRole.from_hash(hash["role"]) if hash["role"]
        hash["resource"] = ZResource.from_hash(hash["resource"]) if hash["resource"]
        ZUrr.new hash
      end
    end
  end
end