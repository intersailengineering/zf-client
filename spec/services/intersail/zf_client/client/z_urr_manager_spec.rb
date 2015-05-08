require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUrrManager, type: :client do
        it_should_behave_like "httparty_validatable"
        it_should_behave_like "httparty_resourceable",
                              {uri: {urr_uri: "/urrs"},
                               base_uri: {urr_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update],
                               resource_class: ZUrr
                              }
      end
    end
  end
end
