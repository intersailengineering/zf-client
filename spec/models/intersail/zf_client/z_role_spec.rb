require 'rails_helper'

module Intersail
  module ZfClient
    describe ZRole, type: :model do
      subject { build(:role) }
      it_should_behave_like "tree_resource"
    end
  end
end