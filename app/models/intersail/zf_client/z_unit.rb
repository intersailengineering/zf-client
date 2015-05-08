module Intersail
  module ZfClient
    class ZUnit
      #@dup all the code here is the same as for the role, extract to mixin
      include Serializable
      include Infoable
      extend DefaultZeroId
      extend NestedResource

      # Attributes
      attr_accessor :name
      attr_accessor :description
      attr_accessor :parent
      # Attributes that default to 0
      zero_attributes [:id]
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