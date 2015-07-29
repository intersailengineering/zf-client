module Intersail
  module ZfClient
    module Client
      class ZHashManager
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.hash_base_uri) unless self.class.base_uri
          self.resource_class = Hash
        end

        # Resourceable
        def active_resource_methods
          [:create, :read, :update, :delete, :list]
        end
      end
    end
  end
end