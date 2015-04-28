require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUserManager, type: :client do
        before(:all) do
          @z_token = SecureRandom.uuid
          @um = ZUserManager.new(@z_token)
        end

        it_behaves_like "httparty_validatable"

        it "behaves like a ZUserManagement client" do
          #@jtodoIMP go from here and do the real client remember for the
          # need of get patch delete method also and fix of post
          expect(@um).to have_attr_accessor(:z_token)

          expect(@um.z_token).to be == @z_token
        end

        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        #@jtodoIMP complete all the tests below
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

        context "single unit" do
          it "should create unit" do
            expect(@um).to respond_to(:create_unit)
          end
          it "should read unit" do
            expect(@um).to respond_to(:get_unit)
          end
          it "should update unit" do
            expect(@um).to respond_to(:update_unit)
          end
          it "should delete unit" do
            expect(@um).to respond_to(:delete_unit)
          end
        end

        context "all units" do
          it "should list all unit info" do
            expect(@um).to respond_to(:all_units)
          end
          it "should list all units filtered" do
            expect(@um).to respond_to(:all_units)
          end
        end

        context "single role" do
          it "should create role" do
            expect(@um).to respond_to(:create_role)
          end
          it "should read role" do
            expect(@um).to respond_to(:get_role)
          end
          it "should update role" do
            expect(@um).to respond_to(:update_role)
          end
          it "should delete role" do
            expect(@um).to respond_to(:delete_role)
          end
        end

        context "all roles" do
          it "should list all role info" do
            expect(@um).to respond_to(:all_roles)
          end
          it "should list all roles filtered" do
            expect(@um).to respond_to(:all_roles)
          end
        end

        context "acl" do
          it "should create acl" do
            expect(@um).to respond_to(:create_acl)
          end
          it "should read acl" do
            expect(@um).to respond_to(:get_acl)
          end
          it "should update acl" do
            expect(@um).to respond_to(:update_acl)
          end
          it "should delete acl" do
            expect(@um).to respond_to(:delete_acl)
          end
        end

        context "all acls" do
          it "should list all role info" do
            expect(@um).to respond_to(:all_acls)
          end
          it "should list all acls filtered" do
            expect(@um).to respond_to(:all_acls)
          end
        end


        context "urr" do
          it "should create urr" do
            expect(@um).to respond_to(:create_urr)
          end
          it "should read urr" do
            expect(@um).to respond_to(:get_urr)
          end
          it "should delete urr" do
            expect(@um).to respond_to(:delete_urr)
          end
        end

      end
    end
  end
end