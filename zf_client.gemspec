$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "zf_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "zf_client"
  s.version     = ZfClient::VERSION
  s.authors     = ["jacopo-beschi-intersail"]
  s.email       = ["jacopo.beschi@intersail.it"]
  s.homepage    = "http://www.intersail.it"
  s.summary     = "Summary of ZfClient."
  s.description = "Description of ZfClient."
  s.license     = "PROPRIETARY"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1"
  # Build fake data
  #@jtodoMed remove this after removing fake data builder
  s.add_dependency 'faker'

  # Databse connector
  # s.add_dependency 'pg'
  s.add_dependency 'httparty'

  # Development
  # Sqlite db connector
  s.add_development_dependency "sqlite3"
  # Rspec
  s.add_development_dependency 'rspec-rails'
  # Automated tests with guard
  s.add_development_dependency 'guard-rspec'
  # Auto Clean DB
  # s.add_development_dependency 'database_cleaner'
  # More Rspec matches
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'shoulda-callback-matchers', '~> 1.1.1'

  # Automated Object building
  s.add_development_dependency "factory_girl_rails", "~> 4.0"
  # Build fake data
  # Uncomment here
  # s.add_development_dependency 'faker'
end
