module Intersail
  shared_examples "nested_resourceable" do
    it { is_expected.to extends(NestedResource)}
    it { is_expected.to respond_to(:id)}
    it { is_expected.to respond_to(:parent)}
  end
end
