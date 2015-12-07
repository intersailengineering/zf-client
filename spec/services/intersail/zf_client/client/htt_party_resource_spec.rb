require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe 'HttpPartyResource' do
        class HTTPartyResourceStub
          include HTTPartyResource

          def after_initialize
            super
          end

          def setup_test_data(resource_uri, resource_class)
            @resource_uri = resource_uri
            @resource_class = resource_class
            self
          end

          def active_resource_methods
            [:create, :read, :update, :delete, :list]
          end
        end

        let(:obj) { OpenStruct.new }
        subject { stub = HTTPartyResourceStub.new; stub.setup_test_data("/resource", obj) }
        let(:api_single_res) { OpenStruct.new }
        let(:api_multiple_res) { [OpenStruct.new, OpenStruct.new] }

        it_should_behave_like "httparty_resourceable"

        describe '#resource_class=' do
          context 'klass is not Hash' do
            let(:klass) { Object }
            it "sets resource class only if respond to? from_hash" do
              expect { subject.resource_class=klass }.to raise_error(StandardError, "You need to pass a resource class that respond_to from_hash")
            end
          end
          context 'klass is Hash' do
            let(:klass) { Hash }
            it 'sets resource class' do
              expect { subject.resource_class=klass }.to change { subject.instance_variable_get("@resource_class") }.to(klass)
            end
          end
        end

        it "calls super with after_initialize" do
          module StubSuper
            def after_initialize
            end
          end

          class SuperCallClass
            include StubSuper
            include HTTPartyResource
          end

          expect_any_instance_of(StubSuper).to receive(:after_initialize).at_least(1)
          SuperCallClass.new.after_initialize
        end

        context "defaults" do
          class HTTPartyResourceEmptyStub
            include HTTPartyValidatable
            include HTTPartyResource
          end

          subject { HTTPartyResourceEmptyStub.new }

          it "has empty active_resource_methods" do
            expect(subject.active_resource_methods).to be == []
          end

          it "not implement any of the resource methods" do
            expect(subject).to_not respond_to :create
            expect(subject).to_not respond_to :read
            expect(subject).to_not respond_to :update
            expect(subject).to_not respond_to :delete
            expect(subject).to_not respond_to :list
          end
        end

        describe "api" do
          it "creates resource" do
            expect(subject).to receive(:_post)
                               .with(subject.resource_uri, obj)
                               .and_return(api_single_res)

            expect(subject).to receive(:build_result).with(api_single_res) { {} }

            expect(subject.create(obj)).to be == {}
          end

          it "reads resource" do
            filter = {key1: "value1", key2: 2}
            id = Faker::Number.digit
            uri = "#{subject.resource_uri}/#{id}?key1=value1&key2=2"
            expect(subject).to receive(:_get)
                               .with(uri)
                               .and_return(api_single_res)

            expect(subject).to receive(:build_result).with(api_single_res) { {} }

            expect(subject.read(id, filter)).to be == {}
          end

          it "updates a resource" do
            id = Faker::Number.digit
            uri = "#{subject.resource_uri}/#{id}"
            expect(subject).to receive(:_put)
                               .with(uri, obj)
                               .and_return(api_single_res)

            expect(subject).to receive(:build_result).with(api_single_res) { {} }

            expect(subject.update(id, obj)).to be == {}
          end

          it "deletes a resource" do
            id = Faker::Number.digit
            uri = "#{subject.resource_uri}/#{id}"
            expect(subject).to receive(:_delete)
                               .with(uri)
            subject.delete(id)
          end

          it "lists all resource as info" do
            expect(subject).to receive(:_get)
                               .with(subject.resource_uri)
                               .and_return(api_multiple_res)

            expect(subject).to receive(:build_result).twice.with(api_multiple_res[0]) { {} }

            # validate building of response as json
            expect(subject.list({})).to be == [{}, {}]
          end

          it "lists all resources as info filtered" do
            filter = {key1: "value1", key2: 2}
            uri = "#{subject.resource_uri}?key1=value1&key2=2"
            expect(subject).to receive(:_get)
                               .with(uri)
                               .and_return(api_multiple_res)

            expect(subject).to receive(:build_result).twice.with(api_multiple_res[0]) { {} }

            # validate building of response as json
            expect(subject.list(filter)).to be == [{}, {}]
          end

          describe '#build_result' do
            let(:result_hash) { Hash.new }
            before { subject.instance_variable_set("@resource_class", klass)}
            context 'klass is != Hash' do
              let(:klass) { Object }
              context 'is_raw' do
                before {subject.is_raw = true}
                it 'returns the result_hash' do
                  expect(klass).to_not receive(:from_hash)
                  expect(subject.send("build_result",result_hash)).to eq(result_hash)
                end
              end
              context 'is not raw' do
                before {subject.is_raw = false}
                it 'calls from_hash with the result_hash' do
                  expect(klass).to receive(:from_hash).with(result_hash)
                  subject.send("build_result",result_hash)
                end
              end
            end
            context 'klass is Hash' do
              let(:klass) { Hash }
              it 'returns the result_hash' do
                expect(klass).to_not receive(:from_hash)
                expect(subject.send("build_result",result_hash)).to eq(result_hash)
              end
            end
          end

          describe '#raw' do
            it 'creates a copy of self with is_raw == true' do
              expect(subject.raw).to_not eq subject
              expect(subject.raw.is_raw).to eq true
            end
          end

          describe 'is_raw' do
            it 'is false by default' do
              expect(subject.is_raw).to eq false
            end
          end
        end
      end
    end
  end
end