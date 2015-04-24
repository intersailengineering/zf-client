require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      RSpec.describe ZUserManagement, type: :client do

        xit "behaves like a ZUserManagement client"

        context "configuration" do
          xit "should use initializer settings as default"
        end

        context "single user" do
          xit "should create user"
          xit "should read user"
          xit "should update user"
          xit "should delete user"
        end

        context "all users" do
          xit "should list all user info"
          xit "should list all users filtered"
        end

        #@jtodoIMP create the user resource now, integrate it into zum_engine, cloned from andrea one and with test fixed tell to andrea, then do same for role and permissions
      end
    end
  end
end