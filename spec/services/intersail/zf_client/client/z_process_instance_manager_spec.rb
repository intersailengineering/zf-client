require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZProcessInstanceManager, type: :client do
        it_behaves_like "httparty_validatable"

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
          let(:p_def) { build(:z_process_inst) }
          let(:success_res) { build(:success_pdef_create_res_success) }
          let(:error_res) { build(:success_pdef_create_res_error) }

          context "stub validation" do
            subject { p_def }
            it_behaves_like "process_instance"
          end

          it "should create a process definition" do
            expect(subject).to receive(:_post)
                               .with(p_def, subject.process_uri)
                               .and_return(success_res)

            process_id = success_res["process_id"]
            p_def.id = process_id

            expect(subject.create(p_def)).to be == p_def
          end
          xit "should apply transition"
          xit "should abort process"
        end
      end
    end
  end
end
