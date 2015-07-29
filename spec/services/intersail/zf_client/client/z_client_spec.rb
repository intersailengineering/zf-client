require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZClient, type: :client do
        # Stubs
        class StubManager
          include HTTPartyResource

          def stub_method
          end
        end

        class StubClient < ZClient
          private

          def delegated
            {
                stub_m: Intersail::ZfClient::Client::StubManager,
                stub_struct: Class.new do
                  include HTTPartyResource
                end
            }
          end
        end

        describe "stub validation" do
          subject { StubManager.new }
          it_should_behave_like "httparty_validatable"
        end

        describe "client delegation" do
          before(:all) do
            @z_token = SecureRandom.uuid
            @base_uri = "http://fake-base.com"
            @z_client = ZClient.new(@z_token, @base_uri)
            @z_client_stub = StubClient.new(@z_token, @base_uri)
          end

          describe "configuration" do
            it "initializes himself with z_token and base_uri" do
              expect(@z_client_stub.z_token).to be == @z_token
              expect(@z_client_stub.base_uri).to be == @base_uri
            end

            it "initializes all the manager with token and base_uri" do
              expect(@z_client_stub).to have_attr_accessor :stub_m
              expect(@z_client_stub.stub_m.class).to be == StubManager
              expect(@z_client_stub.stub_m.z_token).to be == @z_token
              expect(@z_client_stub.stub_m.base_uri).to be == @base_uri
            end

            it "has valid delegated classes" do
              expect(@z_client.delegated).to be == {
                  user: Intersail::ZfClient::Client::ZUserManager,
                  resource: Intersail::ZfClient::Client::ZResourceManager,
                  role: Intersail::ZfClient::Client::ZRoleManager,
                  unit: Intersail::ZfClient::Client::ZUnitManager,
                  urr: Intersail::ZfClient::Client::ZUrrManager,
                  acl: Intersail::ZfClient::Client::ZAclManager,
                  process_instance: Intersail::ZfClient::Client::ZProcessInstanceManager,
                  process_def: Intersail::ZfClient::Client::ZProcessDefManager,
                  activity_def: Intersail::ZfClient::Client::ZActivityDefManager
              }
            end
          end

          describe "method delegation" do
            it "delegates crud methods to user" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list, :delete], :user, :user)
            end

            it "delegates crud methods to resources" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list], :resource, :resource)
            end

            it "delegates crud methods to role" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list, :delete], :role, :role)
            end

            it "delegates crud methods to unit" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list, :delete], :unit, :unit)
            end

            it "delegates crud methods to urr" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list], :urr, :urr)
            end

            it "delegates crud methods to acl" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list, :delete], :acl, :acl)
            end

            it "delegates crud methods to process_instance" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :abort, :apply_transition], :process_instance, :process_instance)
            end

            it "delegates crud methods to process_def" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list, :delete], :process_def, :process_def)
            end

            it "delegates crud methods to activity_def" do
              expect(@z_client).to delegate_methods_with_prefix([:create, :read, :update, :list, :delete], :activity_def, :activity_def)
            end
          end

          describe "#method_missing" do
            context '{#resource_#method} url given' do
              it "creates an HashManager and initialize his configuration" do
                d_hash_manager = double("hash_manager")
                expect(d_hash_manager).to receive(:read).with(1)
                expect(d_hash_manager).to receive(:resource_uri=).with("/ress")
                expect(Intersail::ZfClient::Client::ZHashManager).to receive(:new).with(@z_token, @base_uri) { d_hash_manager }

                @z_client.res_read(1)
              end
            end
          end

          describe '#respond_to?' do
              xit 'responds to {#resource_#method}'
              xit "doesn't respond otherwise"
          end
        end
      end
    end
  end
end