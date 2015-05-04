require 'rails_helper'

module Intersail
  module ZfClient
    describe ZProcessProperty, type: :model do
      subject { build(:z_process_property) }

      it { is_expected.to have_attr_accessor(:name) }
      it { is_expected.to have_attr_accessor(:value) }
      it { is_expected.to includes(ActiveModel::Model) }
      it { is_expected.to includes(ActiveModel::Serializers::JSON) }

      it "should validate his attributes" do
        expect(subject).to validate_presence_of(:name)
        expect(subject).to validate_presence_of(:value)
      end

      it "should be serializable as json" do
        expect(subject.as_json).to be == {
            "name" => subject.name,
            "value" => subject.value,
        }
      end
    end
  end
end
