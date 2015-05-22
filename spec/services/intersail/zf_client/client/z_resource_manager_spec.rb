require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZResourceManager, type: :client do
        it_should_behave_like "httparty_validatable"
        it_should_behave_like "httparty_resourceable",
                              {uri: {resource_uri: "/resources"},
                               base_uri: {resource_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :list],
                               resource_class: ZResource
                              }
      end
    end
  end
end