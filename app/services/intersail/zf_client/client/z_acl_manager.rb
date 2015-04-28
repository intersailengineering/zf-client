module Intersail
  module ZfClient
    module Client
      class ZAclManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

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

      end
    end
  end
end