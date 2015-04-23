module Intersail
  module ZapFlow
    module Client
      class ZProcess
        include HTTParty

        attr_accessor :z_token
        attr_accessor :base_uri
        attr_accessor :create_process_uri
        attr_accessor :abort_process_uri
        attr_accessor :apply_transition_uri

        #@jtodoIMP extract all below as mixin
        def initialize(base_uri = nil, z_token = nil)
          self.class.base_uri(base_uri)
          self.z_token = z_token
          #@jtodoIMP make token mandatory because it's needed for auth and
          # is different for every user!
          initialize_config
        end

        def header
          {"X-ZToken" => self.z_token, "Accept" => "application/json"}
        end

        def post(data_jsonable, relative_uri)
          self.class.post relative_uri, body: data_jsonable.as_json, headers: header
        end


        def doValidation(object_validatable)
          raise(Intersail::Errors::StandardValidationError, object_validatable.errors.full_messages) unless object_validatable.valid?
        end

        ###### no more mixin below here

        # process def is a z_process_def obj as_json
        def create_process_def(process_def)
          doValidation(process_def)
          #@jtodoIMP handle when pass with ot without /
          post(process_def, self.create_process_uri)
        end

        def initialize_config
          self.class.base_uri(ZapFlow.config.process_def_base_uri) unless self.class.base_uri
          self.z_token ||= ZapFlow.config.process_def_z_token
          self.create_process_uri = ZapFlow.config.create_process_uri
          self.abort_process_uri = ZapFlow.config.abort_process_uri
          self.apply_transition_uri = ZapFlow.config.apply_transition_uri
        end
      end
    end
  end
end
