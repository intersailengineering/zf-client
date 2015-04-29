require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZAclManager, type: :client do

        #@jtodoIMP complete all the tests below
        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        context "acl" do
          it "should create acl" do
            expect(subject).to respond_to(:create_acl)
          end
          it "should read acl" do
            expect(subject).to respond_to(:get_acl)
          end
          it "should update acl" do
            expect(subject).to respond_to(:update_acl)
          end
          it "should delete acl" do
            expect(subject).to respond_to(:delete_acl)
          end
        end

        context "all acls" do
          it "should list all role info" do
            expect(subject).to respond_to(:all_acls)
          end
          it "should list all acls filtered" do
            expect(subject).to respond_to(:all_acls)
          end
        end
      end
    end
  end
end