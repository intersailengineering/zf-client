require 'rails_helper'

module Intersail
  shared_examples "default_zero" do |attributes = nil|
    it { is_expected.to includes(DefaultZeroId) }
    it {is_expected.to includes(ActiveModel::Model)}

    if attributes
      it "should return id 0 if falsey" do
        attributes.each do |attr|
          expect(subject).to respond_to attr
          expect(subject).to respond_to "#{attr}="
        end
      end
    end
  end
end

