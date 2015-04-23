module Intersail
  module ZfClient
    class Configuration
      # Configuration available options

      # Process
      # Def
      attr_accessor :create_process_uri
      attr_accessor :abort_process_uri
      attr_accessor :apply_transition_uri
      attr_accessor :process_def_base_uri
      attr_accessor :process_def_z_token

      # User and Acl
      #@jtodoLOW add accessors
    end
  end
end
