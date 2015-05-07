module Intersail
  module ZfClient
    class Configuration
      # Process instance
      attr_accessor :process_uri
      attr_accessor :process_base_uri

      # User
      attr_accessor :user_uri
      attr_accessor :user_base_uri

      # Unit
      attr_accessor :unit_uri
      attr_accessor :unit_base_uri

      # Role
      attr_accessor :role_uri
      attr_accessor :role_base_uri

      # Acl
      attr_accessor :acl_uri
      attr_accessor :acl_base_uri
    end
  end
end
