module Intersail
  module ZfClient
    def self.config
      @config ||= Configuration.new
    end

    def self.configure
      yield(self.config) if block_given?
    end
  end
end
