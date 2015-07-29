require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZAclManager, type: :client do
        it_should_behave_like "httparty_resourceable",
                              {uri: {acl_uri: "/acls"},
                               base_uri: {acl_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :delete, :list],
                               resource_class: ZAcl
                              }
      end
    end
  end
end