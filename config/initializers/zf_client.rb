Intersail::ZfClient.configure do |config|
  # Debug
  config.debug = true
  ##
  # Url configuration
  ##
  base_uri = "http://srvdelivery.staging.vpn/RestService"
  # Process instance
  config.process_uri = "/processes"
  config.process_base_uri = base_uri
  # Process def
  config.process_def_uri = "/process_defs"
  config.process_def_base_uri = base_uri
  # Activity def
  config.activity_def_uri = "/activity_defs"
  config.activity_def_base_uri = base_uri
  # User
  config.user_uri = "/users"
  config.user_base_uri = base_uri
  # Resource
  config.resource_uri = "/resources"
  config.resource_base_uri = base_uri
  # Unit
  config.unit_uri = "/units"
  config.unit_base_uri = base_uri
  # Role
  config.role_uri = "/roles"
  config.role_base_uri = base_uri
  # Urr
  config.urr_uri = "/urrs"
  config.urr_base_uri = base_uri
  # Acl
  config.acl_uri = "/acls"
  config.acl_base_uri = base_uri
  # General resource as Hash
  config.hash_base_uri = base_uri
end