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
      # Attributes that default to 0
      def zero_attributes
        [:id]
      end

      # Validation
      validates_presence_of :name
      validates_presence_of :app_domain
      validates :ignore_history, exclusion: {in: [nil]}

      def attributes
        {
            "id" => nil,
            "name" => "",
            "app_domain" => "",
            "ignore_history" => false
        }
      end

      def attributes_to_include
        []
      end

      class << self
        def from_hash(hash)
          Intersail::ZfClient::ZProcessDef.new(hash)
        end
      end
    end
  end
end
