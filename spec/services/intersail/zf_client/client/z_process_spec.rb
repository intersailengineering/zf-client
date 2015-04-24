require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      RSpec.describe ZProcess, type: :model do
        before(:all) do
          @z_token = SecureRandom.uuid
          @process = ZProcess.new(@z_token)
        end

        it "behaves like a ZfClient client" do
          expect(@process).to extends(HTTParty)
          expect(@process.class.base_uri).to be == @base_uri
          expect(@process.z_token).to be == @z_token
          expect(@process).to have_attr_accessor(:z_token)
          expect(@process).to have_attr_accessor(:create_process_uri)
          expect(@process).to have_attr_accessor(:abort_process_uri)
          expect(@process).to have_attr_accessor(:apply_transition_uri)
        end

        context "configuration" do
          before(:all) do
            ZfClient.configure do |config|
              config.create_process_uri = "/CreateProcess.aspx"
              config.abort_process_uri = "/AbortProcess.aspx"
              config.apply_transition_uri = "/ApplyTransition.aspx"
              config.process_def_base_uri = "http://base-uri.com"
              config.process_def_z_token = SecureRandom.uuid
            end
            @changed_uri = "http://changed-uri.com"
            @process = ZProcess.new(@z_token)
          end

          it "should use initializer settings as default" do
            expect(@process.create_process_uri).to be == (ZfClient.config.create_process_uri)
            expect(@process.abort_process_uri).to be == (ZfClient.config.abort_process_uri)
            expect(@process.apply_transition_uri).to be == (ZfClient.config.apply_transition_uri)
            # Base uri
            expect(ZProcess.base_uri).to be == (ZfClient.config.process_def_base_uri)
            expect { ZProcess.new(@z_token, @changed_uri) }.to change { ZProcess.base_uri }.to(@changed_uri)
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

          it_behaves_like "client_validatable"

          context "create" do
            it "should create a process definition" do
              expect(@process).to receive(:post)
                                  .with(p_def, @process.create_process_uri)
                                  .and_return(success_res)

              expect(@process.create_process_def(p_def)).to be == success_res
            end
          end

          context "apply_transition" do
            xit "should apply transition"
          end

          context "abort_process" do
            xit "should abort process"
          end
        end
      end
    end
  end
end
