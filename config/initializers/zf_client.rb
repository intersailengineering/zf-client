Intersail::ZfClient.configure do |config|
  # Process creation
  config.create_process_uri = "/CreateProcess.aspx"
  config.abort_process_uri = "/AbortProcess.aspx"
  config.apply_transition_uri = "/ApplyTransition.aspx"
  config.process_def_base_uri = "http://localhost:8080"
  # User creation
  config.user_uri = "/User.aspx"
  config.user_base_uri = "http://localhost:8080"
end