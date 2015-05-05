Intersail::ZfClient.configure do |config|
  # Process instance creation
  config.process_uri = "/process"
  config.process_base_uri = "http://localhost:8080"
  # User creation
  config.user_uri = "/users"
  config.user_base_uri = "http://localhost:8080"
end