module Intersail
  module ZfClient
    class ZAcl

      include ActiveModel::Model
      include Serializable
      include SerializeId

      # Attributes
      attr_accessor :process_id
      attr_accessor :activity_id
      attr_accessor :unit_id
      attr_accessor :role_id
      attr_accessor :resource_id
      attr_accessor :permission
      attr_accessor :priority
      attr_accessor :inherit_unit
      attr_accessor :inherit_role
      attr_accessor :mandatory
      attr_accessor :enabled

      # Validation
      validates_presence_of :process_id
      validates_presence_of :activity_id
      validates_presence_of :unit_id
      validates_presence_of :role_id
      validates_presence_of :resource_id
      validates_presence_of :permission
      validates_presence_of :priority
      validates_presence_of :inherit_unit
      validates_presence_of :inherit_role
      validates_presence_of :mandatory
      validates_presence_of :enabled


      # Serialization
      def attributes
        {
            "process_id" => 0,
            "activity_id" => 0,
            "unit_id" => "",
            "role_id" => "",
            "resource_id" => "",
            "permission" => "",
            "priority" => 0,
            "inherit_unit" => false,
            "inherit_role" => false,
            "mandatory" => true,
            "enabled" => false
        }
      end

      def attributes_to_include
        []
      end
    end
  end
end