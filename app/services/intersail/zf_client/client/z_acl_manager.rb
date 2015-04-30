module Intersail
  module ZfClient
    module Client
      class ZAclManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        def create(acl)
          doValidation(acl)
          acl.id = 1
          acl
        end

        def read(id)
          @faker.build_acl
        end

        def update(acl)
          doValidation(acl)
          acl
        end

        def delete(id)
          nil
        end

        def list(filter = {})
          # ignore filter for now
          (1..20).inject([]) do |items|
            items << @faker.build_acl
          end
        end

      end
    end
  end
end