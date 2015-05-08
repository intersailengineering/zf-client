require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUnit, type: :model do
      subject { build(:unit) }
      it_should_behave_like "tree_resource"
    end
  end
end