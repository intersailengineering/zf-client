require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUserInfo, type: :model do
      subject { @user_info = build(:user_info) }

      it_behaves_like "user_info"

      context "serialization" do
        it_behaves_like "serializable"

        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "first_name" => "",
              "last_name" => "",
              "mail" => "",
              "custom_data" => ""
          }
        end
      end
    end
  end
end