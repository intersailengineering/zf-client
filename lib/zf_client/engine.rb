module ZfClient
  class Engine < ::Rails::Engine
    isolate_namespace ZfClient

    Dir["#{config.root}/lib/**/*.rb"].each { |f| require f }
  end
end
