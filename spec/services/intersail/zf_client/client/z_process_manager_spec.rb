require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      RSpec.describe ZProcessManager, type: :client do
        let(:process) { ZProcessManager.new }
        subject { process }

        it_behaves_like "httparty_validatable"

        it "behaves like a ZProcessManager client" do
          expect(process).to have_attr_accessor(:create_process_uri)
          expect(process).to have_attr_accessor(:abort_process_uri)
          expect(process).to have_attr_accessor(:apply_transition_uri)
        end

        context "configuration" do
          before(:all) do
            ZfClient.configure do |config|
              config.create_process_uri = "/CreateProcess.aspx"
              config.abort_process_uri = "/AbortProcess.aspx"
              config.apply_transition_uri = "/ApplyTransition.aspx"
              config.process_def_base_uri = "http://base-uri.com"
            end
          end

          it "should use initializer settings as default" do
            # run callback
            process.after_initialize

            expect(process.create_process_uri).to be == (ZfClient.config.create_process_uri)
            expect(process.abort_process_uri).to be == (ZfClient.config.abort_process_uri)
            expect(process.apply_transition_uri).to be == (ZfClient.config.apply_transition_uri)
            # reset class base_uri value
            subject.class.class_eval("@default_options[:base_uri] = nil")
            expect(subject.class.new.class.base_uri).to be == (ZfClient.config.process_def_base_uri)
          end
        end

        context "process instance" do
          let(:p_def) { build(:z_process_inst) }
          let(:success_res) { build(:success_pdef_create_res_success) }
          let(:error_res) { build(:success_pdef_create_res_error) }

          context "stub validation" do
            subject { p_def }
            it_behaves_like "process_instance"
          end

          it "should create a process definition" do
            expect(process).to receive(:_post)
                               .with(p_def, process.create_process_uri)
                               .and_return(success_res)

            process_id = success_res["process_id"]
            p_def.id = process_id

            expect(process.create(p_def)).to be == p_def
          end
          xit "should apply transition"
          xit "should abort process"
        end
      end
    end
  end
end
