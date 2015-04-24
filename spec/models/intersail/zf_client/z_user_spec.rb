require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUser, type: :model do
      subject { @user = build(:user) }

      it_behaves_like "user"

      context "serialization" do
        it_behaves_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "username" => "",
              "description" => "",
              "password" => "",
              "active" => false,
              "resource" => nil,
              "profile" => []
          }
        end
      end
    end
  end
end