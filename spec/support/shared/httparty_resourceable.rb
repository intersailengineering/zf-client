module Intersail
  shared_examples "httparty_resourceable" do
    it { is_expected.to includes(Intersail::ZfClient::Client::HTTPartyResource)}
    it { is_expected.to respond_to :active_resource_methods}
    it { is_expected.to respond_to :resource_uri}
    it { is_expected.to respond_to :resource_class }
    it "should call super on after_initialize" do
      expect_any_instance_of(Intersail::ZfClient::Client::HTTPartyResource).to receive(:after_initialize).at_least(1)
      subject.after_initialize
    end
  end
end

