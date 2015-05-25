module Intersail
  module ZfClient
    class ZResource
      include ActiveModel::Model
      include Serializable
      include DefaultZeroId

      # Attributes
      attr_accessor :id
      attr_accessor :first_name
      attr_accessor :last_name
      attr_accessor :mail
      # Hash of custom data
      attr_accessor :custom_data
      # Array of ZUrr items
      attr_accessor :urrs
      # Attributes that default to 0
      def zero_attributes
        [:id]
      end

      # Validation
      validates_presence_of :first_name
      validates_presence_of :last_name
      validates_with Intersail::Validators::SubAttributeValidator, attributes: :urrs

      # Default attributes
      def urrs
        @urrs || []
      end

      # Serialization
      def attributes
        {
            "id" => nil,
            "first_name" => "",
            "last_name" => "",
            "mail" => "",
            "custom_data" => {},
            "urrs" => []
        }
      end

      def attributes_to_include
        [:urrs]
      end

      class << self
        def from_hash(h)
          hash = h.clone
          hash["urrs"] = hash["urrs"] && hash["urrs"].inject([]) do |urrs,urr|
            urrs << Intersail::ZfClient::ZUrr.from_hash(urr)
          end
          Intersail::ZfClient::ZResource.new hash
        end
      end
    end
  end
end