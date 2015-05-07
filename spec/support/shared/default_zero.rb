module Intersail
  shared_examples "default_zero_idable" do
    it {is_expected.to includes(Intersail::DefaultZeroId)}
  end
end

