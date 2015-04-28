# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'rails/all'
require 'rspec/rails'
require 'spec_helper'
require 'database_cleaner'
require 'factory_girl'
require 'faker'
require 'shoulda-matchers'
require 'shoulda-callback-matchers'
require 'httparty'


# Require support files
require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

# Setup migration paths
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../db/migrate', __FILE__)

RSpec.configure do |config|
  # Activate factory girl
  config.include FactoryGirl::Syntax::Methods

  # Database handling
  # migrate test schema if needed
  ActiveRecord::Migrator.migrate(File.join(Rails.root, 'db/migrate'))

  # Clean database at start of the suite and then
  # just uses transactions
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |single_test|
    DatabaseCleaner.cleaning do
      single_test.run
    end
  end
end