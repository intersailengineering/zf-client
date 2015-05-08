require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUserManager, type: :client do
        it_should_behave_like "httparty_validatable"
        it_should_behave_like "httparty_resourceable",
                              {uri: {user_uri: "/user"},
                               base_uri: {user_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :list],
                               resource_class: ZUser
                              }
      end
    end
  end
end