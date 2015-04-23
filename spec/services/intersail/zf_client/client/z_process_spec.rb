require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      RSpec.describe ZProcess, type: :model do
        before(:all) do
          @base_uri = Faker::Internet.url
          @z_token = SecureRandom.uuid
          @process = ZProcess.new(@base_uri, @z_token)
        end

        it "behaves like a ZfClient client" do
          expect(@process).to extends(HTTParty)
          expect(@process.class.base_uri).to be == @base_uri
          expect(@process.z_token).to be == @z_token
          expect(@process).to have_attr_accessor(:z_token)
          expect(@process).to have_attr_accessor(:base_uri)
          expect(@process).to have_attr_accessor(:create_process_uri)
          expect(@process).to have_attr_accessor(:abort_process_uri)
          expect(@process).to have_attr_accessor(:apply_transition_uri)
        end

        context "confiugration" do
          before(:all) do
            ZfClient.configure do |config|
              config.create_process_uri = "/CreateProcess.aspx"
              config.abort_process_uri = "/AbortProcess.aspx"
              config.apply_transition_uri = "/ApplyTransition.aspx"
              config.process_def_base_uri = Faker::Internet.url
              config.process_def_z_token = SecureRandom.uuid
            end
          end

          it "should use initializer settings as default" do
            pending "fix the base uri"
            expect(@process.create_process_uri).to be == (ZfClient.config.create_process_uri)
            expect(@process.abort_process_uri).to be == (ZfClient.config.abort_process_uri)
            expect(@process.apply_transition_uri).to be == (ZfClient.config.apply_transition_uri)

            ZProcess.base_uri(nil)
            p ZProcess.base_uri
            #@jtodoIMP go from here
            expect(ZProcess.new.class.base_uri).to be == (ZfClient.config.process_def_base_uri)
            expect(ZProcess.new.z_token).to be == (ZfClient.config.process_def_z_token)
          end
        end

        #@jTODOimp extract both into shared example
        it "should pass authorization data in the hedader" do
          expect(@process.header["X-ZToken"]).to be == @process.z_token
        end

        it "should pass data content json in header" do
          expect(@process.header["Accept"]).to be == 'application/json'
        end

        context "process definition" do
          let(:p_def) { build(:z_process_def) }
          let(:success_res) { build(:success_pdef_create_res_success) }
          let(:error_res) { build(:success_pdef_create_res_error) }

          context "stub validation" do
            subject { p_def }
            it_behaves_like "process_definition"
          end

          context "create" do
            # Response data: ProcessId , Errors
            context "success" do
              it "should create a process definition" do
                #@jtodoIMP extract to reusable method
                expect(@process.class).to receive(:post)
                                          .with(@process.create_process_uri, body: p_def.as_json, headers: @process.header)
                                          .and_return(success_res)

                expect(@process.create_process_def(p_def)).to be == success_res
              end


            end

            context "error" do
              it "should not create a process definition" do
                #@jtodoIMP extract to reusable method
                expect(@process.class).to receive(:post)
                                          .with(@process.create_process_uri, body: p_def.as_json, headers: @process.header)
                                          .and_return(error_res)

                expect(@process.create_process_def(p_def)).to be == error_res
              end

              it "should not create a process definintion if argument are invalid" do
                expect(p_def).to receive(:valid?) { false }
                allow(p_def).to receive_message_chain(:errors, :full_messages) { "Fake error message" }
                expect { @process.create_process_def(p_def) }.to raise_error(Intersail::Errors::StandardValidationError, p_def.errors.full_messages)
              end
            end
          end

          context "apply_transition" do
            context "success" do
              xit "should apply transition"
            end

            context "error" do
              xit "should not apply transition"
            end
          end

          context "abort_process" do
            context "success" do
              xit "should abort process"
            end

            context "error" do
              xit "should not abort process"
            end
          end
        end
      end
    end
  end
end
