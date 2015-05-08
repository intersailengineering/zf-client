Intersail::ZfClient.configure do |config|
  # Process instance creation
  config.process_uri = "/processes"
  config.process_base_uri = "http://wrkdev-boncri/ZapFlowWsApi"
  # User
  config.user_uri = "/users"
  config.user_base_uri = "http://wrkdev-boncri/ZapFlowWsApi"
  # Unit
  config.unit_uri = "/units"
  config.unit_base_uri = "http://wrkdev-boncri/ZapFlowWsApi"
  # Role
  config.role_uri = "/roles"
  config.role_base_uri = "http://wrkdev-boncri/ZapFlowWsApi"
  # Urr
  config.urr_uri = "/urrs"
  config.urr_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
  # Acl
  config.acl_uri = "/acls"
  config.acl_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
end
