require 'rails_helper'

module Intersail
  module ZfClient
    describe Configuration, type: :model do
      before(:all) do
        class Configuration
          attr_accessor :setted
        end

        ZfClient.configure do |config|
          config.setted = "value1"
        end
      end

      it "should read configuration item" do
        expect(ZfClient.config.setted).to be == "value1"
      end

      it "should change configuration item" do
        expect { ZfClient.config.setted = "value2" }.to change { ZfClient.config.setted }.to("value2")
      end
    end
  end
end
