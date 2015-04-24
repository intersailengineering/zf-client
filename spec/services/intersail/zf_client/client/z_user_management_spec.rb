require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      RSpec.describe ZUserManagement, type: :client do
        before(:all) do
          @z_token = SecureRandom.uuid
          @um = ZUserManagement.new(@z_token)
        end

        it_behaves_like "httparty_validatable"

        it "behaves like a ZUserManagement client" do
          #@jtodoIMP go from here and to the real client remember for the
          # need of get patch delete method also and fix of post
          expect(@um).to have_attr_accessor(:z_token)

          expect(@um.z_token).to be == @z_token
        end

        context "configuration" do
          xit "should use initializer settings as default"
        end

        #@jtodoIMP complete the test here
        context "single user" do
          it "should create user" do
            expect(@um).to respond_to(:create_user)
          end
          it "should read user" do
            expect(@um).to respond_to(:get_user)
          end
          it "should update user" do
            expect(@um).to respond_to(:update_user)
          end
          it "should delete user" do
            expect(@um).to respond_to(:delete_user)
          end
        end

        context "all users" do
          it "should list all user info" do
            expect(@um).to respond_to(:all_users)
          end
          it "should list all users filtered" do
            expect(@um).to respond_to(:all_users)
          end
        end

        #@jtodoIMP create the user resource now, integrate it into zum_engine, cloned from andrea one and with test fixed tell to andrea, then do same for role and permissions
      end
    end
  end
end