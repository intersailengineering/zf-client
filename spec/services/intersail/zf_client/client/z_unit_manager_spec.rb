require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUnitManager, type: :client do

        #@jtodoIMP complete all the tests below
        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        #@dup same for all manager need to refactor
        context "single unit" do
          it "should create unit" do
            expect(subject).to respond_to(:create)
          end
          it "should read unit" do
            expect(subject).to respond_to(:read)
          end
          it "should update unit" do
            expect(subject).to respond_to(:update)
          end
          it "should delete unit" do
            expect(subject).to respond_to(:delete)
          end
        end

        context "all units" do
          it "should list all unit info" do
            expect(subject).to respond_to(:list)
          end
          it "should list all units filtered" do
            expect(subject).to respond_to(:list)
          end
        end
      end
    end
  end
end