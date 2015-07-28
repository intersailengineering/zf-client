module Intersail
  module ZfClient
    module Client

      # == Generic HTTP Resource
      # in order to use it you need to setup:
      # resource_uri: the uri of the resource for example /user
      # resource_class: the class associated to the resource (which need to respond_to from_hash method)
      # active_resource_methods: should return an array containing the methods
      # that you want to activate(as symbols), the available methods are:
      # :create, :read, :update, :delete, :list
      # example:
      # def active_resource_methods() [:create]; end # this will activate only create method
      #
      module HTTPartyResource
        extend ActiveSupport::Concern
        include HTTPartyValidatable

        # Attributes
        attr_accessor :resource_uri

        def resource_class=(klass)
          raise(StandardError, "You need to pass a resource class that respond_to from_hash") unless (klass.respond_to? :from_hash)
          @resource_class=klass
        end

        def resource_class
          @resource_class
        end

        def active_resource_methods
          []
        end

        def after_initialize
          define_resource_methods
          super
        end

        # Dynamic resource method creation
        def define_resource_methods
          active_resource_methods.each do |name|
            send("define_#{name}_method")
          end
        end

        def hash_to_query_string(hash)
          return "" unless hash.any?
          "?".concat hash.map{|key,value| "#{key}=#{value}"}.join("&")
        end

        # Fetches all resources and passes filter hash as a query string
        # the valid options depend on the api called
        # an example could be: {username: "pippo"}
        def define_list_method
          instance_eval do
            def list(filter = {})
              _get("#{self.resource_uri}#{hash_to_query_string(filter)}").collect do |result_hash|
                self.resource_class.from_hash(result_hash)
              end
            end
          end
        end

        def define_delete_method
          instance_eval do
            def delete(id)
              _delete("#{self.resource_uri}/#{id}")
            end
          end
        end

        def define_read_method
          instance_eval do
            def read(id, filter={})
              self.resource_class.from_hash _get("#{self.resource_uri}/#{id}#{hash_to_query_string(filter)}")
            end
          end
        end

        def define_update_method
          instance_eval do
            def update(id, resource)
              self.resource_class.from_hash _put("#{self.resource_uri}/#{id}", resource)
            end
          end
        end

        def define_create_method
          instance_eval do
            def create(resource)
              self.resource_class.from_hash _post(self.resource_uri, resource)
            end
          end
        end
      end
    end
  end
end
