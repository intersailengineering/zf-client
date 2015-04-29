module Intersail
  module ZfClient
    module Client
      class ZUnitManager
        include HTTPartyValidatable

        def after_initialize
            self.class.base_uri(ZfClient.config.user_base_uri) unless self.class.base_uri
            self.create_process_uri = ZfClient.config.create_process_uri
            self.abort_process_uri = ZfClient.config.abort_process_uri
            self.apply_transition_uri = ZfClient.config.apply_transition_uri
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