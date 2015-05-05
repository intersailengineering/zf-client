Intersail::ZfClient.configure do |config|
  # Process instance creation
  config.process_uri = "/processes"
  config.process_base_uri = "http://wrkdev-boncri/ZapFlowWsApi"
  # User creation
  config.user_uri = "/users"
  config.user_base_uri = "http://wrkdev-boncri/ZapFlowWsApi"
end
