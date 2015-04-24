module Intersail
  module ZfClient
    module Client
      class ZProcess
        include HTTParty
        include Validatable

        # Properties
        attr_accessor :create_process_uri
        attr_accessor :abort_process_uri
        attr_accessor :apply_transition_uri
        attr_accessor :z_token

        def initialize(z_token = nil, base_uri = nil)
          self.class.base_uri(base_uri)
          self.z_token = z_token
          initialize_config
        end

        # process def is a z_process_def obj as_json
        def create_process_def(process_def)
          post(process_def, self.create_process_uri)
        end

        def initialize_config
          self.class.base_uri(ZfClient.config.process_def_base_uri) unless self.class.base_uri
          self.create_process_uri = ZfClient.config.create_process_uri
          self.abort_process_uri = ZfClient.config.abort_process_uri
          self.apply_transition_uri = ZfClient.config.apply_transition_uri
        end
      end
    end
  end
end
