require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZPropertyDefManager, type: :client do
        it_should_behave_like "httparty_resourceable",
                              {uri: {property_def_uri: "/property_defs"},
                               base_uri: {property_def_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: ZPropertyDef
                              }
      end
    end
  end
end
