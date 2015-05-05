require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUserManager, type: :client do
        it_behaves_like "httparty_validatable"

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

        # @jtodoIMP extract as mixin for resource where you decide
        # in which method of crud you want to activate
        context "api" do
          let(:user) { build(:user) }
          let(:single_user_res) { as_json(:user_success_res) }
          let(:multiple_user_res) { as_json_list(:user_success_res, 2) }

          context "stub validation" do
            subject { user }
            it_behaves_like "user"
          end

          it "should create user" do
            expect(subject).to receive(:_post)
                               .with(subject.user_uri, user)
                               .and_return(single_user_res)

            expect(ZUser).to receive(:from_hash) { Hash.new }

            expect(subject.create(user)).to be == {}
          end

          it "should read user" do
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_get)
                               .with(uri)
                               .and_return(single_user_res)

            expect(ZUser).to receive(:from_hash) { Hash.new }

            expect(subject.read(id)).to be == {}
          end

          it "should update user" do
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_put)
                               .with(uri, user)
                               .and_return(single_user_res)

            expect(ZUser).to receive(:from_hash) { Hash.new }

            expect(subject.update(id, user)).to be == {}
          end

          it "should delete user" do
            id = Faker::Number.digit
            uri = "#{subject.user_uri}/#{id}"
            expect(subject).to receive(:_delete)
                               .with(uri)
            subject.delete(id)
          end

          it "should list all user as info" do
            expect(subject).to receive(:_get)
                               .with(subject.user_uri)
                               .and_return(multiple_user_res)

            expect(ZUser).to receive(:from_hash).twice { Hash.new }

            # validate building of response as json
            expect(subject.list({})).to be == [{}, {}]
          end

          it "should list all users as info filtered" do
            expect(subject).to respond_to(:list)
          end
        end
      end
    end
  end
end