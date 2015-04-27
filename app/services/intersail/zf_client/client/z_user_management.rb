module Intersail
  module ZfClient
    module Client
      class ZUserManagement
        include HTTPartyValidatable

        # Attributes
        attr_accessor :z_token

        def initialize(z_token = nil, base_uri = nil)
          self.class.base_uri(base_uri)
          self.z_token = z_token
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        # User
        #@jtodoIMP extract
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
          return nil
        end

        def all_users(filter = {})
          # ignore filter for now
          (1..10).inject([]) do |items, index|
            items << @faker.build_user(index, true)
          end
        end

        # Role
        #@jtodoIMP extract

        # Unit
        #@jtodoIMP extract

        # Acl
        #@jtodoIMP extract

      end
    end
  end
end
