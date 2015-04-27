module Intersail
  module ZfClient
    class ZRole
      #@dup all the code here is the same as for the unit
      include ActiveModel::Model
      include Serializable

      # Attributes
      attr_accessor :id
      attr_accessor :name
      attr_accessor :description
      attr_accessor :parent

      # Validation
      validates_presence_of :name
      validates_presence_of :description
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :parent

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