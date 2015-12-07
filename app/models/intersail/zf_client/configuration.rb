module Intersail
  module ZfClient
    class Configuration
      # Logging
      attr_accessor :debug

      attr_accessor :base_uri

      # Process instance
      attr_accessor :process_uri
      attr_accessor :process_base_uri

      # Process def
      attr_accessor :process_def_uri
      attr_accessor :process_def_base_uri

      # Activity def
      attr_accessor :activity_def_uri
      attr_accessor :activity_def_base_uri

      # User
      attr_accessor :user_uri
      attr_accessor :user_base_uri

      # Resource
      attr_accessor :resource_uri
      attr_accessor :resource_base_uri

      # Unit
      attr_accessor :unit_uri
      attr_accessor :unit_base_uri

      # Role
      attr_accessor :role_uri
      attr_accessor :role_base_uri

      # Urr
      attr_accessor :urr_uri
      attr_accessor :urr_base_uri

      # Acl
      attr_accessor :acl_uri
      attr_accessor :acl_base_uri

      # Hash
      attr_accessor :hash_base_uri
    end
  end
end
