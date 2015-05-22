# This is needed to update the initializer automatically
# without restarting the server under development
Rails.application.config.to_prepare do
  Intersail::ZfClient.configure do |config|
    # Debug
    config.debug = true
    # Process instance
    config.process_uri = "/processes"
    config.process_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # Process def
    config.process_def_uri = "/process_defs"
    config.process_def_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # Activity def
    config.activity_def_uri = "/activity_defs"
    config.activity_def_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # User
    config.user_uri = "/users"
    config.user_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # Resource
    config.resource_uri = "/resources"
    config.resource_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # Unit
    config.unit_uri = "/units"
    config.unit_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # Role
    config.role_uri = "/roles"
    config.role_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # Urr
    config.urr_uri = "/urrs"
    config.urr_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
    # Acl
    config.acl_uri = "/acls"
    config.acl_base_uri = "http://wrkdev-jacopo/ZapFlowWsApi"
  end
end
