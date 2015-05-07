module Intersail
  shared_examples "serialize_idable" do
    it {is_expected.to includes(Intersail::SerializeId)}
  end
end

