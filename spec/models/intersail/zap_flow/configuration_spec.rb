require 'rails_helper'

module Intersail
  module ZapFlow
    describe Configuration do
      before(:all) do
        class Configuration
          attr_accessor :setted
        end

        ZapFlow.configure do |config|
          config.setted = "value1"
        end
      end

      it "should read configuration item" do
        expect(ZapFlow.config.setted).to be == "value1"
      end

      it "should change configuration item" do
        expect { ZapFlow.config.setted = "value2" }.to change { ZapFlow.config.setted }.to("value2")
      end
    end
  end
end
