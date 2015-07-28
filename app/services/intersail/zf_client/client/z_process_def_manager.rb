module Intersail
  module ZfClient
    module Client
      class ZProcessDefManager
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.process_def_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.process_def_uri
          self.resource_class = ZProcessDef
        end

        def active_resource_methods
          [:create, :read, :update, :delete, :list]
        end
      end
    end
  end
end