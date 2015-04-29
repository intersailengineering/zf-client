require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUnitManager, type: :client do

        #@jtodoIMP complete all the tests below
        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        context "single unit" do
          it "should create unit" do
            expect(subject).to respond_to(:create_unit)
          end
          it "should read unit" do
            expect(subject).to respond_to(:get_unit)
          end
          it "should update unit" do
            expect(subject).to respond_to(:update_unit)
          end
          it "should delete unit" do
            expect(subject).to respond_to(:delete_unit)
          end
        end

        context "all units" do
          it "should list all unit info" do
            expect(subject).to respond_to(:all_units)
          end
          it "should list all units filtered" do
            expect(subject).to respond_to(:all_units)
          end
        end
      end
    end
  end
end