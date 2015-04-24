require 'rails_helper'

module Intersail
  module ZfClient
    describe ZResource, type: :model do
      subject { @resource = build(:resource) }

      it_behaves_like "resource"

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