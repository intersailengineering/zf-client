module Intersail
  module ZfClient
    module Client
      class ZProcessInstanceManager
        include HTTPartyValidatable

        # Attributes
        attr_accessor :process_uri

        # Create a new process instance
        # requires a valid process_instance is a z_process_instance object
        # Returns the given process instance with his data populated
        def create(process_instance)
          ZProcessInstance.from_hash _post(self.process_uri, process_instance)
        end

        # Apply a process instance transition
        # given the process_instance_id and the transition name
        # it applies the given transition
        def apply_transition(process_instance_id, transition_name)
          _put("#{self.process_uri}/#{process_instance_id}/apply_transition/#{transition_name}")
        end

        # Abort a process instance given his id
        def abort(id)
          _put("#{self.process_uri}/#{id}/abort")
        end

        def after_initialize
          self.class.base_uri(ZfClient.config.process_base_uri) unless self.class.base_uri
          self.process_uri = ZfClient.config.process_uri
        end
      end
    end
  end
end
