require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZProcessDefManager, type: :client do
        it_should_behave_like "httparty_resourceable",
                              {uri: {process_def_uri: "/units"},
                               base_uri: {process_def_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: ZProcessDef
                              }
      end
    end
  end
end
