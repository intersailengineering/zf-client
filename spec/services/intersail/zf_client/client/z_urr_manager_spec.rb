require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUrrManager, type: :client do

        #@jtodoIMP complete all the tests below
        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        #@dup same for all manager need to refactor
        context "urr" do
          it "should create urr" do
            expect(subject).to respond_to(:create)
          end
          it "should read urr" do
            expect(subject).to respond_to(:read)
          end
          it "should delete urr" do
            expect(subject).to respond_to(:delete)
          end
        end
      end
    end
  end
end
