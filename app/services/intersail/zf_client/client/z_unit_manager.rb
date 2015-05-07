module Intersail
  module ZfClient
    module Client
      class ZUnitManager
        include HTTPartyValidatable
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.unit_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.unit_uri
          self.resource_class = ZUnit
        end

        def active_resource_methods
          [:create, :read, :update, :delete, :list]
        end
      end
    end
  end
end