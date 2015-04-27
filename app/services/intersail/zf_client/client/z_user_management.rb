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
          @faker = Intersail::Fake::Builder.new
        end

        def create_user(user)
          return nil unless user.valid?
          user.id = 1
          user
        end

        def get_user(id)
          @faker.build_user(id)
        end

        def update_user(user)
          return nil unless user.valid?
          user
        end

        def delete_user(id)
          # Raise an exception if any problem occurs
          return nil
        end

        def all_users(filter = {})
          # ignore filter for now
          (1..10).inject([]) do |items, index|
            items << @faker.build_user(index)
          end
        end
      end
    end
  end
end
