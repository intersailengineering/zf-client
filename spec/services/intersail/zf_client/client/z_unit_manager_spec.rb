require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUnitManager, type: :client do
        it_should_behave_like "httparty_validatable"
        it_should_behave_like "httparty_resourceable",
                              {uri: {unit_uri: "/units"},
                               base_uri: {unit_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: ZUnit
                              }
      end
    end
  end
end
