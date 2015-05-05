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
          res = _post(process_instance, self.process_uri)
          process_instance.id = res[:process_id]
          process_instance
        end

        def after_initialize
          self.class.base_uri(ZfClient.config.process_base_uri) unless self.class.base_uri
          self.process_uri = ZfClient.config.process_uri
        end
      end
    end
  end
end
