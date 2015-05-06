module Intersail
  module ZfClient
    module Client
      class ZUserManager
        include HTTPartyValidatable

        #@jtodoIMP handle errors

        # Attributes
        attr_accessor :user_uri

        def after_initialize
          self.class.base_uri(ZfClient.config.user_base_uri) unless self.class.base_uri
          self.user_uri = ZfClient.config.user_uri
        end

        #@jtodoIMP extract below as mixin
        #@jtodoIMP handle errors in the mixin
        def create(user)
          ZUser.from_hash _post(self.user_uri, user)
        end

        def read(id)
          ZUser.from_hash _get("#{self.user_uri}/#{id}")
        end

        def update(id, user)
          ZUser.from_hash _put("#{self.user_uri}/#{id}", user)
        end

        def delete(id)
          _delete("#{self.user_uri}/#{id}")
        end

        def list(filter = {})
          _get("#{self.user_uri}").collect do |user_hash|
            ZUser.from_hash(user_hash)
          end
        end
      end
    end
  end
end
