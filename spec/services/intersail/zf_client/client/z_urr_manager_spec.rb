require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUrrManager, type: :client do
        it_behaves_like "httparty_validatable"

        context "configuration" do
          before(:all) do
            ZfClient.configure do |config|
              config.urr_uri = "/urrs"
              config.urr_base_uri = Faker::Internet.url
            end
          end

          it "should use initializer settings as default" do
            # run callback
            subject.after_initialize

            # reset class base_uri value
            subject.class.class_eval("@default_options[:base_uri] = nil")
            expect(subject.class.new.class.base_uri).to be == (ZfClient.config.urr_base_uri)
          end

          context "resourceable" do
            it_behaves_like "httparty_resourceable"

            it "should activate create read update delete list methods on of http_resource" do
              expect(subject.active_resource_methods).to be == [:create, :read, :update]
            end
            it "should setup resource_uri " do
              # run callback
              subject.after_initialize

              expect(subject.resource_uri).to be == ZfClient.config.urr_uri
            end

            it "should setup ZUrr as resource class" do
              expect(subject.resource_class).to be == ZUrr
            end
          end
        end
      end
    end
  end
end
