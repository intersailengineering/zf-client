require 'rails_helper'

module Intersail
  module ZfClient
    describe ZUser, type: :model do

      it_behaves_like "user"

    end
  end
end