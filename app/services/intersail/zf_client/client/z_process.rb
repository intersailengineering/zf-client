module Intersail
  module ZfClient
    module Client
      class ZProcess
        include HTTPartyValidatable

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

        # Create a new process instance
        # requires a valid process_instance is a z_process_instance object
        # Returns the given process instance with his data populated
        #@jtodoIMP change into process instance
        def create_process_inst(process_instance)
          res = post(process_instance, self.create_process_uri)
          process_instance.id = res[:process_id]
          process_instance
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
