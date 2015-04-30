module Intersail
  module ZfClient
    module Client
      class ZProcessManager
        include HTTPartyValidatable

        # Attributes
        attr_accessor :create_process_uri
        attr_accessor :abort_process_uri
        attr_accessor :apply_transition_uri

        # Create a new process instance
        # requires a valid process_instance is a z_process_instance object
        # Returns the given process instance with his data populated
        def create(process_instance)
          res = _post(process_instance, self.create_process_uri)
          process_instance.id = res[:process_id]
          process_instance
        end

        def after_initialize
          self.class.base_uri(ZfClient.config.process_def_base_uri) unless self.class.base_uri
          self.create_process_uri = ZfClient.config.create_process_uri
          self.abort_process_uri = ZfClient.config.abort_process_uri
          self.apply_transition_uri = ZfClient.config.apply_transition_uri
        end
      end
    end
  end
end
