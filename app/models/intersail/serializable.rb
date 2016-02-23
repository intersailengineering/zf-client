module Intersail
  module Serializable
    def self.included(receiver)
      receiver.send :include, ActiveModel::Serializers::JSON

      receiver.class_eval do
        def as_json(options = {})
          return nil unless self.valid?
          super(options)
        end

        def serializable_hash(options = {})
          options[:include] = attributes_to_include
          super(options)
        end

        def attributes_to_include
          raise StandardError, "You need to define attributes_to_include method"
        end

        def read_attribute_for_serialization(key)
          send(key).nil? ? attributes.fetch(key) : send(key)
        end
      end
    end
  end
end
