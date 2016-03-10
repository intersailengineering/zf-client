module Intersail
  module ZfClient
    class ZPropertyDef
      include ActiveModel::Model
      include Serializable
      include DefaultZeroId

      # Attributes
      attr_accessor :id
      attr_accessor :name
      attr_accessor :description
      attr_accessor :type
      attr_accessor :process_def_id
      attr_accessor :default_value
      attr_accessor :read_only
      attr_accessor :internal_property
      attr_accessor :deletable
      attr_accessor :deletable_message

      # Attributes that default to 0
      def zero_attributes
        [:id]
      end

      # Validation
      validates_presence_of :name
      validates_presence_of :type
      validates_presence_of :process_def_id

      def attributes
        {
            "id" => nil,
            "name" => nil,
            "description" => nil,
            "type" => 0,
            "process_def_id" => 0,
            "default_value" => nil,
            "read_only" => 0,
            "internal_property" => 0
        }
      end

      def attributes_to_include
        []
      end

      class << self
        def from_hash(hash)
          Intersail::ZfClient::ZPropertyDef.new(hash)
        end
      end
    end
  end
end
