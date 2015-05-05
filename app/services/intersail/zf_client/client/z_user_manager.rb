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

        def create(user)
          ZUser.new(_post(self.user_uri, user))
        end

        def read(id)
          ZUser.new(_get("#{self.user_uri}/#{id}"))
        end

        def update(user)
        end

        def delete(id)
          # Raise an exception if any problem occurs
          nil
        end

        def list(filter = {})
        end
      end
    end
  end
end
