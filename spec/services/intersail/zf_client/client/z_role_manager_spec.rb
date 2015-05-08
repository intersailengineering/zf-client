require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZRoleManager, type: :client do
        it_should_behave_like "httparty_validatable"
        it_should_behave_like "httparty_resourceable",
                              {uri: {role_uri: "/roles"},
                               base_uri: {role_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: ZRole
                              }
      end
    end
  end
end