require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUserManager, type: :client do
        it_behaves_like "httparty_validatable"

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

        #@dup
        #@jtodoIMP extract as mixin
        context "api" do
          let(:user) { build(:user) }
          let(:single_user_res) { as_json(:user_success_res) }
          let(:multiple_user_res) { as_json_list(:user_success_res,3) }

          it "should create user" do
            expect(subject).to receive(:_post)
                               .with(subject.user_uri, user)
                               .and_return(single_user_res)

            expect(subject.create(user).attributes).to be == user.attributes
          end

          it "should read user" do
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_get)
                              .with(uri)
                              .and_return(single_user_res)
            subject.read(id)
          end

          it "should update user" do
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_put)
                               .with(uri, user)
                               .and_return(single_user_res)
            subject.update(id, user)
          end

          it "should delete user" do
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_delete)
                               .with(uri)
            subject.delete(id)
          end

          it "should list all user as info" do
           # pp success_res
           #  uri = subject.user_uri
           #  expect(subject).to receive(:_get)
           #                     .with(uri)
           #                     .and_return()
           #  subject.list({})
          end

          it "should list all users as info filtered" do
            expect(subject).to respond_to(:list)
          end
        end
      end
    end
  end
end