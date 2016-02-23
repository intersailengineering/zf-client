require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZTransitionDefManager, type: :client do
        it_should_behave_like "httparty_resourceable",
                              {uri: {transition_def_uri: "/transition_defs"},
                               base_uri: {transition_def_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: ZTransitionDef
                              }
      end
    end
  end
end
