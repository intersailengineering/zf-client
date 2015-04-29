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

        context "single user" do
          let(:user) { build(:user) }
          let(:success_res) { as_json(:create_user_success_res) }

          it "should create user" do
            expect(subject).to respond_to(:create_user)
            expect(subject).to receive(:post)
                               .with(user, subject.user_uri)
                               .and_return(success_res)

            expect(subject.create_user(user).attributes).to be == user.attributes
          end
          it "should read user" do
            #@jtodoIMP go from here: test post and then use the other methods and implement them into the httpartyvalidatable
            expect(subject).to respond_to(:get_user)
          end
          it "should update user" do
            expect(subject).to respond_to(:update_user)
          end
          it "should delete user" do
            expect(subject).to respond_to(:delete_user)
          end
        end

        context "all users" do
          it "should list all user info" do
            expect(subject).to respond_to(:all_users)
          end
          it "should list all users filtered" do
            expect(subject).to respond_to(:all_users)
          end
        end
      end
    end
  end
end