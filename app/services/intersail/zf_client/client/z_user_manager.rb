module Intersail
  module ZfClient
    module Client
      class ZUserManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        # User
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

        # TODO START REMOVE ALL BELOW

        # Role
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
        # {user_id: 12345}
        def all_roles(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_role
          end
        end

        # Unit
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

        # {user_id: 12345}
        def all_units(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_unit
          end
        end

        # Acl
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

        def all_acls(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_acl
          end
        end

        # Urr
        # {user_id: , role_id:, unit_id: }
        #@jtodoIMP update urr class and refactor it with validation
        def create_urr(ids = {})
          user = @faker.build_user(ids[:user_id])
          role = @faker.build_role
          role.id = ids[:role_id]
          unit = @faker.build_unit
          unit.id = ids[:unit_id]

          urr = @faker.build_urr(user,unit,role)
          urr.id = 1
          urr
        end

        def get_urr(id)
          @faker.build_urr(@faker.build_user(id.to_i),@faker.build_unit,@faker.build_role)
        end

        # {id: 7, user_id: 6, role_id: 4, unit_id: 2}
        def update_urr(ids = {})
          #@jtodoIMP fix this aswell with creation
          user = @faker.build_user(ids[:user_id])
          role = @faker.build_role
          role.id = ids[:role_id]
          unit = @faker.build_unit
          unit.id = ids[:unit_id]

          urr = @faker.build_urr(user,unit,role)
          urr.id = ids[:id]
          urr
        end

        def delete_urr(id)
          nil
        end

        # END REMOVE

      end
    end
  end
end
