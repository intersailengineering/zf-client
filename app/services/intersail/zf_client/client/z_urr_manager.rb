module Intersail
  module ZfClient
    module Client
      class ZUrrManager
        include HTTPartyValidatable
        include HTTPartyResource

        def after_initialize
          super
          self.class.base_uri(ZfClient.config.urr_base_uri) unless self.class.base_uri
          self.resource_uri = ZfClient.config.urr_uri
          self.resource_class = ZUrr
        end

        def active_resource_methods
          [:create, :read, :update]
        end

      end
    end
  end
end