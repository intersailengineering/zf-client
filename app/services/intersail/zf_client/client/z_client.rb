module Intersail
  module ZfClient
    module Client
      class ZClient

        attr_accessor :z_token
        attr_accessor :base_uri

        def initialize(z_token = nil, base_uri = nil)
          self.base_uri = base_uri
          self.z_token = z_token
          initialize_clients
        end

        ##
        # Delegation
        ##

        # List of all the methods that needs to be delegated
        delegate :create, :read, :update, :list, :delete, to: :user, prefix: :user
        delegate :create, :read, :update, :list, :delete, to: :role, prefix: :role
        delegate :create, :read, :update, :list, :delete, to: :unit, prefix: :unit
        delegate :create, :read, :update, to: :urr, prefix: :urr
        delegate :create, :read, :update, :list, :delete, to: :acl, prefix: :acl
        delegate :create, :abort, :apply_transition, to: :process_instance, prefix: :process_instance

        # List of all the managers as name => class
        def delegated
          {
              user: Intersail::ZfClient::Client::ZFakeUserManager,
              role: Intersail::ZfClient::Client::ZRoleManager,
              unit: Intersail::ZfClient::Client::ZUnitManager,
              urr: Intersail::ZfClient::Client::ZUrrManager,
              acl: Intersail::ZfClient::Client::ZAclManager,
              process_instance: Intersail::ZfClient::Client::ZProcessInstanceManager
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