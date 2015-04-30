require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZAclManager, type: :client do

        #@jtodoIMP complete all the tests below
        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        #@dup same for all manager need to refactor
        context "single acl" do
          it "should create acl" do
            expect(subject).to respond_to(:create)
          end
          it "should read acl" do
            expect(subject).to respond_to(:read)
          end
          it "should update acl" do
            expect(subject).to respond_to(:update)
          end
          it "should delete acl" do
            expect(subject).to respond_to(:delete)
          end
        end

        context "all acls" do
          it "should list all role info" do
            expect(subject).to respond_to(:list)
          end
          it "should list all acls filtered" do
            expect(subject).to respond_to(:list)
          end
        end
      end
    end
  end
end