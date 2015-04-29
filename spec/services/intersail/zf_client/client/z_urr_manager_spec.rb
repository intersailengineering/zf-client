require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUrrManager, type: :client do

        #@jtodoIMP complete all the tests below
        context "configuration" do
          xit "should setup def settings with after_initialize"
        end

        context "urr" do
          it "should create urr" do
            expect(subject).to respond_to(:create_urr)
          end
          it "should read urr" do
            expect(subject).to respond_to(:get_urr)
          end
          it "should delete urr" do
            expect(subject).to respond_to(:delete_urr)
          end
        end
      end
    end
  end
end
