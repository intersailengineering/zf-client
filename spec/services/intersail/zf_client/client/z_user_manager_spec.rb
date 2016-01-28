require 'rails_helper'

module Intersail
  module ZfClient
    module Client
      describe ZUserManager, type: :client do
        it_should_behave_like "httparty_resourceable",
                              {uri: {user_uri: "/user"},
                               base_uri: {user_base_uri: Faker::Internet.url},
                               active_resource_methods: [:create, :read, :update, :list],
                               resource_class: ZUser
                              }

        describe '#reset_password' do
          let(:user_id) {1}
          before {@success_res = OpenStruct.new(code: 200, to_h: {id: user_id, email: "fake@mail.com", password: "new_random_password"}) }
          it 'calls post with /users/id/reset_password and returns the UserPassword obj' do
            expect(subject).to receive(:call_method).with(:post, {}, "/users/#{user_id}/reset_password").and_return(@success_res)
            expect(subject.reset_password user_id ).to eq @success_res
          end

          it 'handles error returning the error message' do
            expect(subject).to receive(:call_method).with(:post, {}, "/users/#{user_id}/reset_password").and_raise{StandardError}
            expect{subject.reset_password user_id}.to raise_error(StandardError)
          end
        end
      end
    end
  end
end