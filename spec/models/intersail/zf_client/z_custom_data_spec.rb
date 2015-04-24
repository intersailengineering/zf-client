require 'rails_helper'

module Intersail
  module ZfClient
    describe ZCustomData, type: :model do
      it_behaves_like "custom_data"
    end
  end
end