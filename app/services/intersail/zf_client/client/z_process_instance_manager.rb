module Intersail
  module ZfClient
    module Client
      class ZProcessInstanceManager
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.process_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.process_uri
          self.resource_class = ZProcessInstance
        end

        # Resourceable
        def active_resource_methods
          [:create]
        end

        # Apply a process instance transition
        # given the process_instance_id and the transition name
        # it applies the given transition
        def apply_transition(process_instance_id, transition_name)
          _put("#{self.resource_uri}/#{process_instance_id}/apply_transition/#{transition_name}")
        end

        # Abort a process instance given his id
        def abort(id)
          _put("#{self.resource_uri}/#{id}/abort")
        end

      end
    end
  end
end
