module Intersail
  module ZfClient
    module Client
      class ZRoleManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

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
      end
    end
  end
end