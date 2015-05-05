require 'faker'

module Intersail
  module Fake
    class Builder
      def build_user(id, is_info = false)
        user = Intersail::ZfClient::ZUser.new({
                                                  id: id.to_i,
                                                  username: Faker::Name.name,
                                                  description: Faker::Name.name,
                                                  active: true,
                                              })
        user.resource = build_resource(id)
        unless is_info
          urrs = [build_urr(build_unit, build_role, user.resource)]
          user.resource.urrs = urrs
        end
        user
      end

      def build_resource(id, urrs = [])
        Intersail::ZfClient::ZResource.new({
                                               id: id,
                                               first_name: Faker::Name.first_name,
                                               last_name: Faker::Name.last_name,
                                               mail: Faker::Internet.email,
                                               custom_data: {
                                                   "field1" => Faker::Name.name,
                                                   "field2" => Faker::Name.name
                                               },
                                               urrs: urrs})
      end

      def build_unit(is_info = false)
        Intersail::ZfClient::ZUnit.new(unit_role_params(is_info, Intersail::ZfClient::ZUnit))
      end

      def build_role(is_info = false)
        Intersail::ZfClient::ZRole.new(unit_role_params(is_info, Intersail::ZfClient::ZRole))
      end

      def unit_role_params(is_info, klass)
        parent = nil
        parent_id = Faker::Number.number(2)

        unless is_info
          parent = klass.new({
                                 id: Faker::Number.number(2),
                                 name: Faker::Lorem.word,
                                 description: Faker::Lorem.words(5),
                                 parent: nil
                             })
          parent_id = nil
        end

        {
            id: Faker::Number.number(2),
            name: Faker::Lorem.word,
            description: Faker::Lorem.words(5),
            parent: parent,
            parent_id: parent_id
        }
      end

      def build_urr(unit, role, resource)
        Intersail::ZfClient::ZUrr.new({
                                          id: Faker::Number.number(2),
                                          unit: unit,
                                          role: role,
                                          resource: resource
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