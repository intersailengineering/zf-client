require 'rails_helper'

module Intersail
  module ZfClient
    describe ZRole, type: :model do
      subject { @role = build(:role) }

      it_behaves_like "role"

      context "serialization" do
        #it_behaves_like "serializable"
        # it "should have serialization attributes" do
        #   expect(subject.attributes).to be == {
        #       "role" => [],
        #       "resource" => []
        #   }
        # end

        # it "should include role and resource" do
        #   expect(subject.attributes_to_include).to be == [:role, :resource]
        # end
      end
    end
  end
end