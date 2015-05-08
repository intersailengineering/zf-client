require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZProcessInstanceManager, type: :client do
        it_should_behave_like "httparty_validatable"

        context "configuration" do
          before(:all) do
            ZfClient.configure do |config|
              config.process_uri = "/Process.aspx"
              config.process_base_uri = "http://base-uri.com"
            end
          end

          it "should use initializer settings as default" do
            # run callback
            subject.after_initialize

            expect(subject.process_uri).to be == (ZfClient.config.process_uri)
            # reset class base_uri value
            subject.class.class_eval("@default_options[:base_uri] = nil")
            expect(subject.class.new.class.base_uri).to be == (ZfClient.config.process_base_uri)
          end
        end

        context "api" do
          let(:p_inst) { build(:z_process_inst) }
          let(:single_process_res) { as_json(:process_instance_success_res) }

          context "stub validation" do
            subject { p_inst }
            it_should_behave_like "process_instance"
          end

          #@jtodoIMP use the resource mixin with only c of crud
          it "should create a process definition" do
            expect(subject).to receive(:_post)
                               .with(subject.process_uri, p_inst)
                               .and_return(single_process_res)

            expect(ZProcessInstance).to receive(:from_hash) { Hash.new }

            expect(subject.create(p_inst)).to be == {}
          end

          it "should apply transition" do
            p_inst_id = 1
            transition_name = "name"
            uri = "#{subject.process_uri}/#{p_inst_id}/apply_transition/#{transition_name}"
            expect(subject).to receive(:_put)
                              .with(uri)

            #@jtodoIMP check for return expetation
            subject.apply_transition(p_inst_id, transition_name)
          end

          it "should abort process instance" do
            p_inst_id = 1
            uri = "#{subject.process_uri}/#{p_inst_id}/abort"
            expect(subject).to receive(:_put)
                               .with(uri)

            #@jtodoIMP check for return expetation
            subject.abort(p_inst_id)
          end
        end
      end
    end
  end
end
