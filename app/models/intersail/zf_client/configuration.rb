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

      # UserManangement
      attr_accessor :user_uri
      attr_accessor :user_base_uri
    end
  end
end
