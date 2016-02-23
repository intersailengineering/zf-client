module Intersail
  module ZfClient
    class ZTransitionDef
      include ActiveModel::Model
      include Serializable
      include DefaultZeroId

      # Attributes
      attr_accessor :id
      attr_accessor :name
      attr_accessor :activity_result
      attr_accessor :rules
      attr_accessor :manager
      attr_accessor :priority
      attr_accessor :start_activity_id
      attr_accessor :end_activity_id
      attr_accessor :process_definition_id
      attr_accessor :user_change_required
      attr_accessor :comment_title
      attr_accessor :reverse_transition_id

      # Attributes that default to 0
      def zero_attributes
        [:id]
      end

      # Validation
      validates_presence_of :name
      validates_presence_of :activity_result
      validates_presence_of :start_activity_id
      validates_presence_of :end_activity_id
      validates_presence_of :process_definition_id

      def attributes
        {
            "id" => nil,
            "name" => nil,
            "activity_result" => 0,
            "rules" => nil,
            "manager" => nil,
            "priority" => 0,
            "start_activity_id" => 0,
            "end_activity_id" => 0,
            "process_definition_id" => 0,
            "user_change_required" => 0,
            "comment_title" => nil,
            "reverse_transition_id" => 0
        }
      end

      def attributes_to_include
        []
      end

      class << self
        def from_hash(hash)
          Intersail::ZfClient::ZTransitionDef.new(hash)
        end
      end
    end
  end
end
