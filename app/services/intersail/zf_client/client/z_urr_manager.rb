module Intersail
  module ZfClient
    module Client
      class ZUrrManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        # Urr
        # {user_id: , role_id:, unit_id: }
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

        def delete_urr(id)
          nil
        end

      end
    end
  end
end