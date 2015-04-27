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
        end

        def create_user(user)
          return nil unless user.valid?
          user.id = 1
          user
        end

        def get_user(id)
          user = FactoryGirl.build(:user)
          user.id = id
          return user
        end

        def update_user(user)
          return nil unless user.valid?
          user
        end

        def delete_user(id)
          # Raise an exception if any problem occurs
          return nil
        end

        def all_users
          (1..10).to_a.inject([]) do |users, index|
            fake_user = FactoryGirl.build(:user)
            fake_user.urr = nil
            users.push(fake_user)
          end
          users
        end
      end
    end
  end
end
