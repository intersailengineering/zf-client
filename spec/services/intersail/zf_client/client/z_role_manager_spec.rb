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
        end

        #@dup same for all manager need to refactor
        it "should create role" do
          expect(subject).to respond_to(:create)
        end
        it "should read role" do
          expect(subject).to respond_to(:read)
        end
        it "should update role" do
          expect(subject).to respond_to(:update)
        end
        it "should delete role" do
          expect(subject).to respond_to(:delete)
        end

        context "all roles" do
          it "should list all role info" do
            expect(subject).to respond_to(:list)
          end
          it "should list all roles filtered" do
            expect(subject).to respond_to(:list)
          end
        end
      end
    end
  end
end