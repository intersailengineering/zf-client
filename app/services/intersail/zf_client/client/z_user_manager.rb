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
          self.resource_class = ZUser
        end

        # Resourceable
        def active_resource_methods
          [:create, :read, :update, :list]
        end

        # This is a comment to show the available filter for the list
        # the available filter options are the following:
        # username: "string"
        # active: boolean
        # mail: "string"
        # first_name: "string"
        # last_name: "string"
        # role_id: integer
        # unit_id: integer
        # all the options are attached with AND operator
        # def list(filter ={})
        # end
      end
    end
  end
end
