#@jtodoIMP comment this out when faking is done

require 'faker'

module Intersail
  module Fake
    class Builder
      def build_user(id, no_urrs = false)
        user = Intersail::ZfClient::ZUser.new({
                                                  id: id.to_i,
                                                  username: Faker::Name.name,
                                                  description: Faker::Name.name,
                                                  password: Faker::Internet.password(8),
                                                  active: true,
                                              })
        user.profile = build_profile
        user.urrs = [build_urr(user, build_unit, build_role)] unless no_urrs
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
                                          id: Faker::Number(2),
                                          user: user,
                                          unit: unit,
                                          role: role
                                      })
      end

      def build_acl
        Intersail::ZfClient::ZAcl.new({
                                          process_id: Faker::Number.digit,
                                          activity_id: Faker::Number.digit,
                                          unit_id: Faker::Number.digit,
                                          role_id: Faker::Number.digit,
                                          resource_id: Faker::Number.digit,
                                          permission: Faker::Lorem.characters(3),
                                          priority: Faker::Number.digit,
                                          inherit_unit: false,
                                          inherit_role: false,
                                          mandatory: true,
                                          enabled: true
                                      })
      end
    end
  end
end