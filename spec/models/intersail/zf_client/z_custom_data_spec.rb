require 'rails_helper'

module Intersail
  module ZfClient
    describe ZCustomData, type: :model do
      subject { @custom_data = build(:custom_data) }

      it_behaves_like "custom_data"

      context "serialization" do
        it_behaves_like "serializable"

        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "name" => "",
              "value" => "",
          }
        end
      end
    end
  end
end