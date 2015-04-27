module ZfClient
  class Engine < ::Rails::Engine
    isolate_namespace ZfClient

    config.autoload_paths << File.expand_path("#{config.root}/lib", __FILE__)
  end
end
