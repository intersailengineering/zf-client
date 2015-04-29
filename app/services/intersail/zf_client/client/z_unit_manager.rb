module Intersail
  module ZfClient
    module Client
      class ZUnitManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

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
      end
    end
  end
end