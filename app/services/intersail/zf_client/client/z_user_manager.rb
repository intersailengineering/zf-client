module Intersail
  module ZfClient
    module Client
      class ZUserManager
        include HTTPartyValidatable

        def after_initialize
          #@jtodoIMP remove this when faking is done
          @faker = Intersail::Fake::Builder.new
        end

        # User
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
          nil
        end

        def all_users(filter = {})
          # ignore filter for now
          (1..10).inject([]) do |items, index|
            items << @faker.build_user(index, true)
          end
        end
      end
    end
  end
end
