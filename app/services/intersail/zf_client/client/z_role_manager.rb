module Intersail
  module ZfClient
    module Client
      class ZRoleManager
        include HTTPartyValidatable
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.role_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.role_uri
          self.resource_class = ZRole
        end

        def active_resource_methods
          [:create, :read, :update, :delete, :list]
        end
      end
    end
  end
end