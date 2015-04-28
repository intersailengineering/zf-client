module Intersail
  module ZfClient
    module Client
      class ZClient

        attr_accessor :z_token
        attr_accessor :base_uri

        def initialize(z_token = nil, base_uri = nil)
          self.base_uri = base_uri
          self.z_token = z_token
          # initialize_clients
        end

        private
        # def initialize_clients
        #   delegated.each do |name, klass|
        #     self.class_eval do
        #
        #     end
        #   end
        # end

        def delegated
          # TODO test and check for values
        end
      end
    end
  end
end