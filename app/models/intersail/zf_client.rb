module Intersail
  module ZfClient
    class << self
      def config
        @config ||= Intersail::ZfClient::Configuration.new
      end

      def configure
        yield(config) if block_given?
      end
    end
  end
end
