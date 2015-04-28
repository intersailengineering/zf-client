module Intersail
  module ZfClient
    module Client
      class ZUrrManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        def create_urr(urr)
          doValidation(urr)
          urr.id = 1
          urr
        end

        def get_urr(id)
          @faker.build_urr(@faker.build_user(id.to_i),@faker.build_unit,@faker.build_role)
        end

        def update_urr(urr)
          doValidation(urr)
          urr
        end

        def delete_urr(id)
          nil
        end

        def all_urrs(filter = {})
          # ignore filter for now
          (1..5).inject([]) do |items, key|
            items << @faker.build_urr(@faker.build_user(key.to_i),@faker.build_unit,@faker.build_role)
          end
        end
      end
    end
  end
end