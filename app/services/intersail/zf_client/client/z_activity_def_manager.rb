module Intersail
  module ZfClient
    module Client
      class ZActivityDefManager
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.activity_def_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.activity_def_uri
          self.resource_class = ZActivityDef
        end

        # Resourceable
        def active_resource_methods
          [:create, :read, :update, :delete, :list]
        end
      end
    end
  end
end