require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe 'HttpPartyResource' do

        class HTTPartyResourceStub
          include HTTPartyValidatable
          include HTTPartyResource

          def initialize(resource_uri, resource_class)
            @resource_uri = resource_uri
            @resource_class = resource_class
            super()
          end

          def after_initialize
            super
          end

          def active_resource_methods
            [:create, :read, :update, :delete, :list]
          end
        end

        let(:obj) { OpenStruct.new }
        let(:api_single_res) { OpenStruct.new }
        let(:api_multiple_res) { [OpenStruct.new, OpenStruct.new] }
        subject { HTTPartyResourceStub.new("/resource", obj) }

        it_behaves_like "httparty_resourceable"

        it "should set resource class only if respond to? from_hash" do
          expect{subject.resource_class=[]}.to raise_error(StandardError, "You need to pass a resource class that respond_to from_hash")
        end

        it "should call super with after_initialize" do
          module StubSuper
            def after_initialize
            end
          end

          class SuperCallClass
            include StubSuper
            include HTTPartyResource
          end

          expect_any_instance_of(StubSuper).to receive(:after_initialize)
          SuperCallClass.new.after_initialize
        end

        context "defaults" do
          class HTTPartyResourceEmptyStub
            include HTTPartyValidatable
            include HTTPartyResource
          end

          subject { HTTPartyResourceEmptyStub.new }

          it "should have empty active_resource_methods" do
            expect(subject.active_resource_methods).to be == []
          end

          it "should not implement any of the resource methods" do
            expect(subject).to_not respond_to :create
            expect(subject).to_not respond_to :read
            expect(subject).to_not respond_to :update
            expect(subject).to_not respond_to :delete
            expect(subject).to_not respond_to :list
          end
        end

        context "api" do
          it "should create resource" do
            expect(subject).to receive(:_post)
                               .with(subject.resource_uri, obj)
                               .and_return(api_single_res)

            expect(subject.resource_class).to receive(:from_hash).with(api_single_res) { {} }

            expect(subject.create(obj)).to be == {}
          end

          it "should read resource" do
            id = Faker::Number.digit
            uri = "#{subject.resource_uri}/#{id}"
            expect(subject).to receive(:_get)
                               .with(uri)
                               .and_return(api_single_res)

            expect(subject.resource_class).to receive(:from_hash).with(api_single_res) { {} }

            expect(subject.read(id)).to be == {}
          end

          it "should update resource" do
            id = Faker::Number.digit
            uri = "#{subject.resource_uri}/#{id}"
            expect(subject).to receive(:_put)
                               .with(uri, obj)
                               .and_return(api_single_res)

            expect(subject.resource_class).to receive(:from_hash).with(api_single_res) { {} }

            expect(subject.update(id, obj)).to be == {}
          end

          it "should delete resource" do
            id = Faker::Number.digit
            uri = "#{subject.resource_uri}/#{id}"
            expect(subject).to receive(:_delete)
                               .with(uri)
            subject.delete(id)
          end

          it "should list all resource as info" do
            expect(subject).to receive(:_get)
                               .with(subject.resource_uri)
                               .and_return(api_multiple_res)

            expect(subject.resource_class).to receive(:from_hash).twice.with(api_multiple_res[0]) { {} }

            # validate building of response as json
            expect(subject.list({})).to be == [{}, {}]
          end

          xit "should list all resources as info filtered"
        end
      end
    end
  end
end