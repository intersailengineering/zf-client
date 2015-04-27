module Intersail
  module ZfClient
    module Client
      class ZUserManagement
        include HTTPartyValidatable

        # Attributes
        attr_accessor :z_token

        def initialize(z_token = nil, base_uri = nil)
          self.class.base_uri(base_uri)
          self.z_token = z_token
        end

        def create_user
           # IMPLEMENT FAKE HERE
        end

        def get_user
           # IMPLEMENT FAKE HERE
        end

        def update_user
           # IMPLEMENT FAKE HERE
        end

        def delete_user
           # IMPLEMENT FAKE HERE
        end

        def all_users
           # IMPLEMENT FAKE HERE WITH USER_INFO DATA SO NO URR INFO
        end
      end
    end
  end
end