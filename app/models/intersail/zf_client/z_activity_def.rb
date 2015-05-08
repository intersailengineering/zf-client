module Intersail
  module ZfClient
    class ZActivityDef
      include ActiveModel::Model
      include Serializable
      extend DefaultZeroId

      # Attributes
      attr_accessor :name
      attr_accessor :type
      attr_accessor :in_param_string
      attr_accessor :manager
      attr_accessor :process_result
      attr_accessor :process_definition_id
      attr_accessor :enabled
      # Attributes that default to 0
      zero_attributes [:id]

      # Validation
      validates_presence_of :name
      validates_presence_of :type
      validates_presence_of :process_definition_id
      validates :enabled, exclusion: {in: [nil]}

      def attributes
        {
            "id" => nil,
            "name" => "",
            "type" => 0,
            "in_param_string" => nil,
            "manager" => nil,
            "process_result" => 0,
            "process_definition_id" => 0,
            "enabled" => false
        }
      end

      def attributes_to_include
        []
      end

      class << self
        def from_hash(hash)
          ZActivityDef.new(hash)
        end
      end
    end
  end
end