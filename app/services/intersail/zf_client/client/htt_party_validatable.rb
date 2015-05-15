require 'httparty'

module Intersail
  module ZfClient
    module Client

      # Handles HTTParty method calls and validation
      # You need to include this module first because it uses
      # after_initialize for method hooks, other modules need to override this method
      # in order to make it work.
      # NOTE: also call super on after_initialize implemented methods in order to call initializer
      # on all the subclasses

      module  HTTPartyValidatable
        def self.included(base)
          # Depends on HTTParty
          base.send :include, HTTParty
        end

        attr_accessor :z_token
        attr_accessor :debug

        def initialize(z_token = nil, base_uri = nil)
          self.z_token = z_token
          self.base_uri = base_uri
          self.debug = ZfClient.config.debug
          after_initialize
        end

        def base_uri=(uri)
          self.class.base_uri uri
        end

        def base_uri
          self.class.base_uri
        end

        def after_initialize
          # method hook used for other modules or sublcasses
        end

        def header
          {"X-Session-Token" => self.z_token, "Content-Type" => "application/json"}
        end

        def _get(relative_uri, obj = nil)
          doValidation(obj)
          call_method(:get, obj, relative_uri)
        end

        def _post(relative_uri, obj = nil)
          doValidation(obj)
          call_method(:post, obj, relative_uri)
        end

        def _put(relative_uri, obj = nil)
          doValidation(obj)
          call_method(:put, obj, relative_uri)
        end

        def _delete(relative_uri, obj = nil)
          doValidation(obj)
          call_method(:delete, obj, relative_uri)
        end

        def call_method(method, obj, relative_uri)
          res = do_request(method, obj, relative_uri)
          record_info(obj,res,relative_uri)
          raise(StandardError, res.body) if res.code == 500
          res
        end

        def do_request(method, obj, relative_uri)
          self.class.send(method, relative_uri, body: obj.to_json, headers: header)
        end

        def doValidation(object_validatable)
          return if object_validatable.nil?
          raise(Intersail::Errors::StandardValidationError, "You need to provide a validatable object") unless object_validatable.respond_to?(:valid?)
          raise(Intersail::Errors::StandardValidationError, object_validatable.errors.full_messages) unless object_validatable.valid?
        end

        # Logging

        def debug?
          return true if self.debug
          false
        end

        def logger
          Logger.new("#{Rails.root}/log/client.log")
        end

        def record_info(obj, res, uri)
          return unless debug?

          msg = %Q{request_body: #{obj.as_json}
request_uri: #{uri}
response_body: #{res.body}
response_code: #{res.code}
          }
          logger.info(msg)
        end
      end
    end
  end
end
