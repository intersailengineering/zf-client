require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUserManager, type: :client do
        it_behaves_like "httparty_validatable"

        #@jtodoIMP complete all the tests below
        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        context "single user" do
          it "should create user" do
            expect(subject).to respond_to(:create_user)
          end
          it "should read user" do
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