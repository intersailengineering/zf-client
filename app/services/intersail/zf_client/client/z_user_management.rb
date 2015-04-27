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
          build_user(id)
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
            fake_user = self.build_user(index)
            users.push(fake_user)
          end
          users
        end

        private

        # Build fake data
        def build_user(id)
          user = ZUser.new({
                               id: id,
                               username: Faker::Name.name,
                               description: Faker::Name.name,
                               password: Faker::Internet.password(8),
                               active: true,
                           })
          user.profile = build_profile
          user.urr = build_urr(user, build_unit, build_role)
          user
        end

        def build_profile
          ZUserProfile.new({
                           first_name: Faker::Name.first_name,
                           last_name: Faker::Name.last_name,
                           mail: Faker::Internet.email,
                           custom_data: ZCustomData.new({
                                                            name: Faker::Lorem.word,
                                                            value: Faker::Lorem.word
                                                        })
                       })
        end

        def build_unit
          ZUnit.new({
                        id: Faker::Number.number(4),
                        name: Faker::Lorem.word,
                        description: Faker::Lorem.words(5),
                        parent: (ZUnit.new({
                                               id: Faker::Number.number(4),
                                               name: Faker::Lorem.word,
                                               description: Faker::Lorem.words(5),
                                               parent: nil
                                           }))
                    })
        end

        def build_role
          ZRole.new({
                        id: Faker::Number.number(4),
                        name: Faker::Lorem.word,
                        description: Faker::Lorem.words(5),
                        parent: (ZUnit.new({
                                               id: Faker::Number.number(4),
                                               name: Faker::Lorem.word,
                                               description: Faker::Lorem.words(5),
                                               parent: nil
                                           }))
                    })
        end

        def build_urr(user, unit, role)
          ZUrr.new({
                       user: user,
                       unit: unit,
                       role: role
                   })
        end

      end
    end
  end
end
