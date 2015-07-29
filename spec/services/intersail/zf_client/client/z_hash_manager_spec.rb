require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZHashManager do
        it_should_behave_like "httparty_resourceable",
                              {
                               base_uri: {hash_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: Hash
                              }
      end
    end
  end
end