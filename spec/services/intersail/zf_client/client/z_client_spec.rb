require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZClient, type: :client do
        # Stubs
        class StubManager
          include HTTPartyValidatable
        end

        class StubClient < ZClient
          private

          def delegated
            {stub_m: Intersail::ZfClient::Client::StubManager}
          end
        end

        context "stub validation" do
          subject { StubManager.new }
          it_behaves_like "httparty_validatable"
        end

        before(:all) do
          @z_token = SecureRandom.uuid
          @base_uri = Faker::Internet.url
          @z_client = StubClient.new(@z_token, @base_uri)
        end

        context "configuration" do
          it "should initialize himself with z_token and base_uri" do
            expect(@z_client.z_token).to be == @z_token
            expect(@z_client.base_uri).to be == @base_uri
          end

          it "should initialize himself with all the manager configured" do
            expect(@z_client).to have_attr_accessor :stub_m
            expect(@z_client.stub_m.class).to be == StubManager
          end

          xit "should have valid clients for delegation"
        end

        context "delegation" do
          xit "should delegate method calls to his manager"
        end
      end
    end
  end
end