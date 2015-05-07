module Intersail
  module ZfClient
    module Client
      class ZUserManager
        include HTTPartyValidatable
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.user_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.user_uri
        end

        # Resourceable
        def active_resource_methods
          [:create, :read, :update, :delete, :list]
        end
      end
    end
  end
end
