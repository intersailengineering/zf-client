require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUser, type: :model do
      subject { build(:user) }

      it_behaves_like "user"

      context "serialization" do
        it_behaves_like "serializable"
        it "should have serialization attributes" do
          expect(subject.attributes).to be == {
              "username" => "",
              "description" => "",
              "active" => false,
              "resource" => nil
          }
        end

        it "should include resource and urrs" do
          expect(subject.attributes_to_include).to be == [:resource]
        end
      end
    end
  end
end