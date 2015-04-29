module Intersail
  module ZfClient
    module Client
      class ZUserManager
        include HTTPartyValidatable

        # Attributes
        attr_accessor :user_uri

        def after_initialize
          self.class.base_uri(ZfClient.config.user_base_uri) unless self.class.base_uri
          self.user_uri = ZfClient.config.user_uri
        end

        # User
        def create_user(user)
          post(user, self.user_uri)
        end

        def get_user(id)
        end

        def update_user(user)
        end

        def delete_user(id)
          # Raise an exception if any problem occurs
          nil
        end

        def all_users(filter = {})
        end
      end
    end
  end
end
