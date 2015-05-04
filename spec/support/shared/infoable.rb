module Intersail
  shared_examples "infoable" do
    it {is_expected.to includes(Infoable)}
    it {is_expected.to includes(ActiveModel::Model)}
    it {is_expected.to respond_to(:infoable_attributes)}
  end
end