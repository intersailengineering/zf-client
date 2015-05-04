module Intersail
  module ZfClient
    module Client
      class ZFakeUserManager
        include HTTPartyValidatable

        def after_initialize
          @faker = Intersail::Fake::Builder.new
        end

        # User
        def create(user)
          doValidation(user)
          user.id = 1
          user
        end

        def read(id)
          @faker.build_user(id)
        end

        def update(user)
          doValidation(user)
          user
        end

        def delete(id)
          # Raise an exception if any problem occurs
          nil
        end

        def list(filter = {})
          # ignore filter for now
          (1..10).inject([]) do |items, index|
            items << @faker.build_user(index, true)
          end
        end
      end
    end
  end
end
