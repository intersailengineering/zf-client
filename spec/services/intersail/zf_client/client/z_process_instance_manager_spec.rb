require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZProcessInstanceManager, type: :client do
        it_should_behave_like "httparty_resourceable",
                              {uri: {process_uri: "/process"},
                               base_uri: {process_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create],
                               resource_class: ZProcessInstance
                              }
        context "api" do
          let(:p_inst) { build(:z_process_inst) }
          let(:single_process_res) { as_json(:process_instance_success_res) }

          context "stub validation" do
            subject { p_inst }
            it_should_behave_like "process_instance"
          end

          it "should create a process definition" do
            expect(subject).to receive(:_post)
                               .with(subject.resource_uri, p_inst)
                               .and_return(single_process_res)

            expect(ZProcessInstance).to receive(:from_hash) { Hash.new }

            expect(subject.create(p_inst)).to be == {}
          end

          it "should apply transition" do
            p_inst_id = 1
            transition_name = "name"
            uri = "#{subject.resource_uri}/#{p_inst_id}/apply_transition/#{transition_name}"
            expect(subject).to receive(:_put)
                              .with(uri)

            #@jtodoIMP check for return expetation
            subject.apply_transition(p_inst_id, transition_name)
          end

          it "should abort process instance" do
            p_inst_id = 1
            uri = "#{subject.resource_uri}/#{p_inst_id}/abort"
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
