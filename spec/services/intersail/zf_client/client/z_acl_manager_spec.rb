require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZAclManager, type: :client do
        it_should_behave_like "httparty_validatable"

        context "configuration" do
          context "resourceable" do
            it_should_behave_like "httparty_resourceable",
                { uri: {acl_uri: "/acls"},
                  base_uri: {acl_base_uri: "/acls"}
                }

            #@jtodoIMP extract this in the mixin then put mixin in all manager
            # then fix the unit and resource
            # then pinstance
            # then pdef adef model and test
            # then auth
            it "should activate create read update delete list methods on of http_resource" do
              expect(subject.active_resource_methods).to be == [:create, :read, :update, :delete, :list]
            end
            it "should setup resource_uri " do
              # run callback
              subject.after_initialize

              expect(subject.resource_uri).to be == ZfClient.config.acl_uri
            end

            it "should setup ZAcl as resource class" do
              expect(subject.resource_class).to be == ZAcl
            end
          end
        end
      end
    end
  end
end