module Intersail
  module ZfClient
    class ZUnit
      #@dup all the code here is the same as for the role, extract to mixin
      include ActiveModel::Model
      include Serializable
      include Infoable

      # Attributes
      attr_accessor :id
      attr_accessor :name
      attr_accessor :description
      attr_accessor :parent

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
            "name" => "",
            "description" => "",
            "parent_id" => nil
        }
      end

      def parent_id
        return self.parent.id if self.parent && self.parent.id != nil
        nil
      end

      def attributes_to_include
        []
      end
    end
  end
end