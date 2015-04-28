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

      # UserManangement
      #@jtodoIMP add all accessors for config items
      #@jtodoIMP create a setup like devise that publish initializers!
    end
  end
end
