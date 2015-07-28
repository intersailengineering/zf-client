module Intersail
  module ZfClient
    module Client
      class ZResourceManager
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.resource_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.resource_uri
          self.resource_class = ZResource
        end

        # Resourceable
        def active_resource_methods
          [:create, :read, :update, :list]
        end
      end
    end
  end
end