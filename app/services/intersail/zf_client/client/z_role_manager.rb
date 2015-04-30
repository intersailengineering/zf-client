module Intersail
  module ZfClient
    module Client
      class ZRoleManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        def create(role)
          doValidation(role)
          role.id = 1
          role
        end

        def read(id)
          @faker.build_role
        end

        def update(role)
          doValidation(role)
          role
        end

        def delete(id)
          nil
        end
        # {user_id: 12345}
        def list(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_role
          end
        end
      end
    end
  end
end