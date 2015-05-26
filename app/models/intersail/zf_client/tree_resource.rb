module Intersail
  module ZfClient
    class TreeResource
      include Serializable
      include DefaultZeroId
      include Infoable
      extend NestedResource

      # Attributes
      attr_accessor :id
      attr_accessor :name
      attr_accessor :description
      attr_accessor :parent
      attr_accessor :parent_id
      # Attributes that default to 0
      def zero_attributes
        [:id, :parent_id]
      end

      # Validation
      validates_presence_of :name
      validates_presence_of :description
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :parent

      # Infoable
      def infoable_attributes
        [:parent]
      end

      # Serialization
      def attributes
        {
            "id" => nil,
            "name" => "",
            "description" => "",
            "parent_id" => nil
        }
      end

      def attributes_to_include
        []
      end
    end
  end
end