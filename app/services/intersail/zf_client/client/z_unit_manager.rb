module Intersail
  module ZfClient
    module Client
      class ZUnitManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        def create(unit)
          doValidation(unit)
          unit.id = 1
          unit
        end

        def read(id)
          @faker.build_unit
        end

        def update(unit)
          doValidation(unit)
          unit
        end

        def delete(id)
          nil
        end

        # {user_id: 12345}
        def list(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_unit
          end
        end
      end
    end
  end
end