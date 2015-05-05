module Intersail
  module ZfClient
    class Configuration
      # Configuration available options

      # Process instance
      attr_accessor :process_uri
      attr_accessor :process_base_uri

      # User
      attr_accessor :user_uri
      attr_accessor :user_base_uri
    end
  end
end
