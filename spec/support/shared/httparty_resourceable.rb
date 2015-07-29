require 'rails_helper'

# this shared_example needs a config_options hash: check out some test
# to see his structure: for example z_acl_manager_spec.rb
module Intersail
  shared_examples "httparty_resourceable" do |config_options = {}|
    it_should_behave_like "httparty_validatable"

    context "interface" do
      it { is_expected.to includes(Intersail::ZfClient::Client::HTTPartyResource) }
      it { is_expected.to respond_to :active_resource_methods }
      it { is_expected.to respond_to :resource_uri }
      it "should have a resource class" do
        expect(subject.resource_class).to be_truthy
      end
      it "should call super on after_initialize" do
        expect_any_instance_of(Intersail::ZfClient::Client::HTTPartyResource).to receive(:after_initialize).at_least(1)
        subject.after_initialize
      end
    end

    unless config_options.empty?
      context "configuration" do
        before(:all) do
          ZfClient.configure do |config|
            config.instance_eval(%Q[#{config_options[:uri].keys.first}="#{config_options[:uri].values.first}"]) if config_options.fetch(:uri,false)
            config.instance_eval(%Q[#{config_options[:base_uri].keys.first}="#{config_options[:base_uri].values.first}"])
          end
        end

        it "should use initializer settings as default" do
          # run callback
          subject.after_initialize

          # reset class base_uri value
          subject.class.class_eval("@default_options[:base_uri] = nil")
          expect { subject.class.new }.to change { subject.class.base_uri }.to(ZfClient.instance_eval("config.#{config_options[:base_uri].keys.first}"))
        end

        it "should setup resource_uri " do
          # run callback
          subject.after_initialize

          expect(subject.resource_uri).to be == ZfClient.instance_eval("config.#{config_options[:uri].keys.first}") if config_options.fetch(:uri,false)
        end

        it "should setup Given resource as resource class" do
          expect(subject.resource_class).to be == config_options[:resource_class]
        end

        it "should activate given methods of http_resource" do
          expect(subject.active_resource_methods).to be == config_options[:active_resource_methods]
        end
      end
    end
  end
end

