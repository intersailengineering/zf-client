$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zf_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zf_client"
  s.version     = ZfClient::VERSION
  s.authors     = ["jacopo-beschi-intersail"]
  s.email       = ["jacopo.beschi@intersail.it"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ZfClient."
  s.description = "TODO: Description of ZfClient."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  # Databse connector
  s.add_dependency 'pg'
  s.add_development_dependency "sqlite3"

  # Development
  # Rspec
  s.add_development_dependency 'rspec-rails'
  # Automated tests with guard
  s.add_development_dependency 'guard-rspec'
  # Auto Clean DB
  s.add_development_dependency 'database_cleaner'
  # More Rspec matches
  s.add_development_dependency 'shoulda-matchers'
  # Automated Object building
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  # Build fake data
  s.add_development_dependency 'faker'
end
