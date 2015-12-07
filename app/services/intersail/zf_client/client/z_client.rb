module Intersail
  module ZfClient
    module Client
      class ZClient
        attr_accessor :z_token
        attr_accessor :base_uri

        def initialize(z_token, base_uri = nil)
          self.base_uri = base_uri || ZfClient.config.base_uri
          self.z_token = z_token
          initialize_clients
        end

        ##
        # Delegation
        ##

        # List of all the methods that needs to be delegated
        # User Management
        delegate :create, :read, :update, :list, :delete, to: :user, prefix: :user
        delegate :create, :read, :update, :list, to: :resource, prefix: :resource
        delegate :create, :read, :update, :list, :delete, to: :role, prefix: :role
        delegate :create, :read, :update, :list, :delete, to: :unit, prefix: :unit
        delegate :create, :read, :update, :list, to: :urr, prefix: :urr
        delegate :create, :read, :update, :list, :delete, to: :acl, prefix: :acl
        # Process handling
        delegate :create, :abort, :apply_transition, to: :process_instance, prefix: :process_instance
        delegate :create, :read, :update, :list, :delete, to: :process_def, prefix: :process_def
        delegate :create, :read, :update, :list, :delete, to: :activity_def, prefix: :activity_def

        # List of all the managers as name => class
        def delegated
          {
              user: Intersail::ZfClient::Client::ZUserManager,
              resource: Intersail::ZfClient::Client::ZResourceManager,
              role: Intersail::ZfClient::Client::ZRoleManager,
              unit: Intersail::ZfClient::Client::ZUnitManager,
              urr: Intersail::ZfClient::Client::ZUrrManager,
              acl: Intersail::ZfClient::Client::ZAclManager,
              process_instance: Intersail::ZfClient::Client::ZProcessInstanceManager,
              process_def: Intersail::ZfClient::Client::ZProcessDefManager,
              activity_def: Intersail::ZfClient::Client::ZActivityDefManager
          }
        end

        private
        def initialize_clients
          delegated.each do |name, klass|
            self.class_eval("attr_accessor :#{name}")
            self.public_send("#{name}=", initialize_client(klass))
          end
        end

        def initialize_client(klass)
          klass.new(@z_token, @base_uri)
        end

        # You can pass a general resource as parameter in the given format: #resource_#metod.
        # in this case the client will make a new instance of hash manager that point to /resources
        # and calls the given method.
        # Example: point_read(1) will call read(1) on ZHashManager with the uri /points
        def method_missing(name, *args, &block)
          if (name =~ /(\w*)\_(\w*)/)
            resource = $1; method = $2
            client = initialize_client(Intersail::ZfClient::Client::ZHashManager)
            client.resource_uri = "/#{resource}s"
            client.send($2, *args)
          else
            super
          end
        end
      end
    end
  end
end