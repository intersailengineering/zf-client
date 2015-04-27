module Intersail
  module Fake
    class Builder
      def build_user(id)
        user = Intersail::ZfClient::ZUser.new({
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
        Intersail::ZfClient::ZUserProfile.new({
                             first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             mail: Faker::Internet.email,
                             custom_data: Intersail::ZfClient::ZCustomData.new({
                                                              name: Faker::Lorem.word,
                                                              value: Faker::Lorem.word
                                                          })
                         })
      end

      def build_unit
        Intersail::ZfClient::ZUnit.new({
                      id: Faker::Number.number(4),
                      name: Faker::Lorem.word,
                      description: Faker::Lorem.words(5),
                      parent: (Intersail::ZfClient::ZUnit.new({
                                             id: Faker::Number.number(4),
                                             name: Faker::Lorem.word,
                                             description: Faker::Lorem.words(5),
                                             parent: nil
                                         }))
                  })
      end

      def build_role
        Intersail::ZfClient::ZRole.new({
                      id: Faker::Number.number(4),
                      name: Faker::Lorem.word,
                      description: Faker::Lorem.words(5),
                      parent: (Intersail::ZfClient::ZUnit.new({
                                             id: Faker::Number.number(4),
                                             name: Faker::Lorem.word,
                                             description: Faker::Lorem.words(5),
                                             parent: nil
                                         }))
                  })
      end

      def build_urr(user, unit, role)
        Intersail::ZfClient::ZUrr.new({
                     user: user,
                     unit: unit,
                     role: role
                 })
      end
    end
  end
end