require 'httparty'

module Intersail
  module ZfClient
    module Client
      module HTTPartyValidatable
        # Depends on HTTParty
        def self.included(base)
          base.send :include, HTTParty

          base.class_eval do
            attr_accessor :z_token

            def initialize(z_token = nil, base_uri = nil)
              self.base_uri = base_uri
              self.z_token = z_token
              after_initialize
            end

            def base_uri=(uri)
              self.class.base_uri uri
            end

            def base_uri
              self.class.base_uri
            end

            def after_initialize
              # does nothing
            end
          end
        end

        def header
          {"X-ZToken" => self.z_token, "Accept" => "application/json"}
        end

        def post(obj, relative_uri)
          doValidation(obj)
          self.class.post relative_uri, body: obj.as_json, headers: header
        end

        def doValidation(object_validatable)
          raise(Intersail::Errors::StandardValidationError, "You need to provide a validatable object") unless object_validatable.respond_to?(:valid?)
          raise(Intersail::Errors::StandardValidationError, object_validatable.errors.full_messages) unless object_validatable.valid?
        end
      end
    end
  end
end
