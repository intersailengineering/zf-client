require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZClient, type: :client do
        # Stubs
        class StubManager
          include HTTPartyValidatable

          def stub_method
          end
        end

        class StubClient < ZClient
          private

          def delegated
            {
                stub_m: Intersail::ZfClient::Client::StubManager,
                stub_struct: Class.new do
                  include HTTPartyValidatable
                end
            }
          end
        end

        context "stub validation" do
          subject { StubManager.new }
          it_behaves_like "httparty_validatable"
        end

        context "client delegation" do
          before(:all) do
            @z_token = SecureRandom.uuid
            @base_uri = "http://fake-base.com"
            @z_client = ZClient.new(@z_token, @base_uri)
            @z_client_stub = StubClient.new(@z_token, @base_uri)
          end

          context "configuration" do
            it "should initialize himself with z_token and base_uri" do
              expect(@z_client_stub.z_token).to be == @z_token
              expect(@z_client_stub.base_uri).to be == @base_uri
            end

            it "should initialize all the manager with token and base_uri" do
              expect(@z_client_stub).to have_attr_accessor :stub_m
              expect(@z_client_stub.stub_m.class).to be == StubManager
              expect(@z_client_stub.stub_m.z_token).to be == @z_token
              expect(@z_client_stub.stub_m.base_uri).to be == @base_uri
            end

            it "should have valid delegated classes" do
              expect(@z_client.delegated).to be == {
                user: Intersail::ZfClient::Client::ZUserManager,
                role: Intersail::ZfClient::Client::ZRoleManager,
                unit: Intersail::ZfClient::Client::ZUnitManager,
                urr: Intersail::ZfClient::Client::ZUrrManager,
                acl: Intersail::ZfClient::Client::ZAclManager,
                process_instance: Intersail::ZfClient::Client::ZProcessInstanceManager
              }
            end
          end

          context "method delegation" do
            it "should delegate method calls to his managers" do
              expect(@z_client_stub.stub_m).to receive(:stub_method)
              @z_client_stub.stub_method
            end
          end
        end

      end
    end
  end
end