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
          [:create, :read, :update, :list]
        end

        # This is a comment to show the available filter for the list
        # the available filter options are the following:
        # unit_id
        # role_id
        # resource_id
        # def list(filter ={})
        # end
      end
    end
  end
end