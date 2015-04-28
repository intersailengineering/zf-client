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
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        # User
        #@jtodoIMP extract
        def create_user(user)
          doValidation(user)
          user.id = 1
          user
        end

        def get_user(id)
          @faker.build_user(id)
        end

        def update_user(user)
          doValidation(user)
          user
        end

        def delete_user(id)
          # Raise an exception if any problem occurs
          nil
        end

        def all_users(filter = {})
          # ignore filter for now
          (1..10).inject([]) do |items, index|
            items << @faker.build_user(index, true)
          end
        end

        # Role
        #@jtodoIMP extract
        def create_role(role)
          doValidation(role)
          role.id = 1
          role
        end

        def get_role(id)
          @faker.build_role
        end

        def update_role(role)
          doValidation(role)
          role
        end

        def delete_role(id)
          nil
        end

        def all_roles(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_role
          end
        end

        # Unit
        #@jtodoIMP extract
        def create_unit(unit)
          doValidation(unit)
          unit.id = 1
          unit
        end

        def get_unit(id)
          @faker.build_unit
        end

        def update_unit(unit)
          doValidation(unit)
          unit
        end

        def delete_unit(id)
          nil
        end

        def all_units(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_unit
          end
        end

        # Acl
        #@jtodoIMP extract
        def create_acl(acl)
          doValidation(acl)
          acl.id = 1
          acl
        end

        def get_acl(id)
          @faker.build_acl
        end

        def update_acl(acl)
          doValidation(acl)
          acl
        end

        def delete_acl(id)
          nil
        end

      end
    end
  end
end
