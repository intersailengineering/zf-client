module Intersail
  module ZfClient
    #@jtodoIMP this is a process instance not a def!!! do refactoring, also clear out client namespace: too much
    class ZProcessDef
      include ActiveModel::Model
      include ActiveModel::Serializers::JSON

      attr_accessor :process_def_id
      attr_accessor :name
      attr_accessor :description
      attr_accessor :properties

      # Validation
      validates_presence_of :process_def_id
      validates_presence_of :name
      validates_presence_of :description
      validates_presence_of :properties
      validates_each :properties do |record, attr, value|
        next if value.nil? || value.empty?
        value.each do |validatable|
          record.errors[attr] = validatable.errors.full_message unless validatable.valid?
        end
      end

      # Serialization
      def as_json(options = nil)
        return nil unless self.valid?
        super(options)
      end

      def attributes
        {
            'ProcessDefId' => 0,
            'Name' => "",
            'Description' => "",
            'Properties' => ""
        }
      end

      #@jtodoIMP remove this and use no camel case
      def ProcessDefId
        self.process_def_id
      end

      def Name
        self.name
      end

      def Description
        self.description
      end

      def Properties
        self.properties.as_json
      end
    end
  end
end
