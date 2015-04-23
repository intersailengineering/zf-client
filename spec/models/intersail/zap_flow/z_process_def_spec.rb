require 'rails_helper'

module Intersail
  module ZapFlow
    RSpec.describe ZProcessDef, type: :model do
      subject { @p_def = build(:z_process_def) }

      it_behaves_like "process_definition"
    end
  end
end
