module Intersail
  module ZfClient
    class ZProcessDef
      include ActiveModel::Model
      include Serializable
      include DefaultZeroId

      # Attributes
      attr_accessor :id
      attr_accessor :name
      attr_accessor :ignore_history
      attr_accessor :app_domain
      attr_accessor :activities
      attr_accessor :transitions
      attr_accessor :properties
      attr_accessor :permissions
      attr_accessor :trigger_defs

      # Attributes that default to 0
      def zero_attributes
        [:id]
      end

      # Validation
      validates_presence_of :name
      validates_presence_of :app_domain
      validates :ignore_history, exclusion: {in: [nil]}
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :activities
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :transitions
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :properties

      def attributes
        {
            "id" => nil,
            "name" => nil,
            "app_domain" => nil,
            "ignore_history" => 0,
            "activities" => [],
            "transitions" => [],
            "properties" => [],
            "permissions" => [],
            "trigger_defs" => []
        }
      end

      def attributes_to_include
        [:activities, :transitions, :properties]
      end

      class << self
        def from_hash(h)
          hash = h.clone
          hash["activities"] = hash["activities"] && hash["activities"].inject([]) do |activities, activity|
            activities << Intersail::ZfClient::ZActivityDef.from_hash(activity)
          end
          hash["transitions"] = hash["transitions"] && hash["transitions"].inject([]) do |transitions, transition|
            transitions << Intersail::ZfClient::ZTransitionDef.from_hash(transition)
          end
          hash["properties"] = hash["properties"] && hash["properties"].inject([]) do |properties, property|
            properties << Intersail::ZfClient::ZPropertyDef.from_hash(property)
          end
          Intersail::ZfClient::ZProcessDef.new(hash)
        end
      end
    end
  end
end
