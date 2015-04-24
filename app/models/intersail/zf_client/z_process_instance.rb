module Intersail
  module ZfClient
    class ZProcessInstance
      include ActiveModel::Model
      include Serializable

      attr_accessor :id
      attr_accessor :process_def_id
      attr_accessor :parent_process_id
      attr_accessor :name
      attr_accessor :description
      attr_accessor :properties

      # Validation
      validates_presence_of :process_def_id
      validates_presence_of :parent_process_id
      validates_presence_of :name
      validates_presence_of :description
      validates_presence_of :properties
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :properties

      # Serialization
      def attributes
        {
          "process_def_id" => 0,
          "parent_process_id" => 0,
          "name" => "",
          "description" => "",
          "properties" => []
        }
      end

      def attributes_to_include
        [:properties]
      end
    end
  end
end
