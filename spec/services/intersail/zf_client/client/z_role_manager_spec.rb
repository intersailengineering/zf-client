require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZRoleManager, type: :client do
        context "single role" do

          #@jtodoIMP complete all the tests below
          context "configuration" do
            xit "should setup def settings with after_initialize"
          end

          it "should create role" do
            expect(subject).to respond_to(:create_role)
          end
          it "should read role" do
            expect(subject).to respond_to(:get_role)
          end
          it "should update role" do
            expect(subject).to respond_to(:update_role)
          end
          it "should delete role" do
            expect(subject).to respond_to(:delete_role)
          end
        end

        context "all roles" do
          it "should list all role info" do
            expect(subject).to respond_to(:all_roles)
          end
          it "should list all roles filtered" do
            expect(subject).to respond_to(:all_roles)
          end
        end
      end
    end
  end
end