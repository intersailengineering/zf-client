module Intersail
  module ZfClient
    module Client
      class ZClient

        #@jtodoIMP go from here, finish this tests then update the urrs model and fake
        # then updae the api calls and then integrate with .net

        attr_accessor :z_token
        attr_accessor :base_uri

        def initialize(z_token = nil, base_uri = nil)
          self.base_uri = base_uri
          self.z_token = z_token
          initialize_clients
        end


        def delegated
          {
              z_user: Intersail::ZfClient::Client::ZUserManager,
              z_role: Intersail::ZfClient::Client::ZRoleManager,
              z_unit: Intersail::ZfClient::Client::ZUnitManager,
              z_urr: Intersail::ZfClient::Client::ZUrrManager,
              z_acl: Intersail::ZfClient::Client::ZAclManager
          }
        end

        private
        def initialize_clients
          delegated.each do |name, klass|
            self.class_eval("attr_accessor :#{name}")
            self.send("#{name}=", initialize_client(klass))
          end
        end

        def initialize_client(klass)
          klass.new(@z_token, @base_uri)
        end
      end
    end
  end
end