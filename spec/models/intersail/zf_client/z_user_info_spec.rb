require 'rails_helper'

module Intersail
  module ZfClient
    RSpec.describe ZUserInfo, type: :model do

      it_behaves_like "user_info"

    end
  end
end