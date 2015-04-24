require 'rails_helper'

module Intersail
  module ZfClient
    RSpec.describe ZProcessInstance, type: :model do
      subject { @p_inst = build(:z_process_inst) }

      it_behaves_like "process_instance"

      context "serialization" do
        xit "should have serialization attributes"

        it_behaves_like "serializable"
      end
    end
  end
end
