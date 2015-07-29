require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZActivityDefManager, type: :client do
        it_should_behave_like "httparty_resourceable",
                              {uri: {activity_def_uri: "/activity_defs"},
                               base_uri: {activity_def_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: ZActivityDef
                              }
      end
    end
  end
end
