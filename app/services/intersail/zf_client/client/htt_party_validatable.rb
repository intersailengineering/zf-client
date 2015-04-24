module Intersail
  module ZfClient
    module Client
      module HTTPartyValidatable
        # Depends on HTTParty
        def self.included(receiver)
          receiver.send :include, HTTParty
        end

        def header
          {"X-ZToken" => self.z_token, "Accept" => "application/json"}
        end

        def post(obj, relative_uri)
          doValidation(obj)
          self.class.post relative_uri, body: obj.as_json, headers: header
        end


        def doValidation(object_validatable)
          raise(Intersail::Errors::StandardValidationError, object_validatable.errors.full_messages) unless object_validatable.valid?
        end
      end
    end
  end
end
