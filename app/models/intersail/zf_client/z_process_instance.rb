module Intersail
  module ZfClient
    class ZProcessInstance
      include ActiveModel::Model
      include Serializable
      include DefaultZeroId

      # Attributes
      attr_accessor :id
      attr_accessor :process_def_id
      attr_accessor :parent_process_id
      attr_accessor :name
      attr_accessor :description
      # Hash of custom properties
      attr_accessor :properties
      # Attributes that default to 0
      def zero_attributes
        [:id]
      end

      # Validation
      validates_presence_of :process_def_id
      validates_presence_of :parent_process_id
      validates_presence_of :name
      validates_presence_of :description

      # Serialization
      def attributes
        {
          "id" => nil,
          "process_def_id" => 0,
          "parent_process_id" => 0,
          "name" => "",
          "description" => "",
          "properties" => {}
        }
      end

      def attributes_to_include
        []
      end

      class << self
        def from_hash(hash)
          Intersail::ZfClient::ZProcessInstance.new hash
        end
      end
    end
  end
end
