require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUserManager, type: :client do
        it_behaves_like "httparty_validatable"

        #@jtodoIMP complete all the tests below
        context "configuration" do
          context "configuration" do
            before(:all) do
              ZfClient.configure do |config|
                config.user_uri = "/User.aspx"
                config.user_base_uri = Faker::Internet.url
              end
            end

            it "should use initializer settings as default" do
              # run callback
              subject.after_initialize

              expect(subject.user_uri).to be == (ZfClient.config.user_uri)
              # reset class base_uri value
              subject.class.class_eval("@default_options[:base_uri] = nil")
              expect(subject.class.new.class.base_uri).to be == (ZfClient.config.user_base_uri)
            end
          end
        end

        context "api" do
          let(:user) { build(:user) }
          let(:success_res) { as_json(:create_user_success_res) }

          it "should create user" do
            expect(subject).to receive(:_post)
                               .with(subject.user_uri, user)
                               .and_return(success_res)

            expect(subject.create(user).attributes).to be == user.attributes
          end

          it "should read user" do
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_get)
                              .with(uri)
                              .and_return(success_res)
            subject.read(id)
          end

          it "should update user" do
            pending "remove password from json user first"
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_put)
                               .with(uri, user)
                               .and_return(success_res)
            subject.update(user)
          end

          it "should delete user" do
            expect(subject).to respond_to(:delete)
          end

          it "should list all user as info" do
            expect(subject).to respond_to(:list)
          end
          it "should list all users as info filtered" do
            expect(subject).to respond_to(:list)
          end
        end
      end
    end
  end
end