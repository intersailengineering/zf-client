module ZfClient
  class Engine < ::Rails::Engine
    isolate_namespace ZfClient

    config.eager_load_paths << File.expand_path("#{config.root}/lib", __FILE__) unless config.eager_load_paths.frozen?
  end
end
