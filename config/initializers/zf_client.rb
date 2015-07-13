# This is needed to update the initializer automatically
# without restarting the server under development
Rails.application.config.to_prepare do
  Intersail::ZfClient.configure do |config|
    # Debug
    config.debug = true
    # Process instance
    config.process_uri = "/processes"
    config.process_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # Process def
    config.process_def_uri = "/process_defs"
    config.process_def_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # Activity def
    config.activity_def_uri = "/activity_defs"
    config.activity_def_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # User
    config.user_uri = "/users"
    config.user_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # Resource
    config.resource_uri = "/resources"
    config.resource_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # Unit
    config.unit_uri = "/units"
    config.unit_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # Role
    config.role_uri = "/roles"
    config.role_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # Urr
    config.urr_uri = "/urrs"
    config.urr_base_uri = "http://srvdelivery.staging.vpn/RestService"
    # Acl
    config.acl_uri = "/acls"
    config.acl_base_uri = "http://srvdelivery.staging.vpn/RestService"
  end
end
