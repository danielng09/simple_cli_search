require 'yaml'
require 'active_record'

# Load database
db_config = YAML::load(File.read("db/config.yml"))
ActiveRecord::Base.establish_connection(db_config["development"])

# Require scripts
require_relative "scripts.rb"

# Require all the models
require_relative "../app/models/organization"
require_relative "../app/models/user"
require_relative "../app/models/ticket"
require_relative "../app/models/user_interface"

# Require all the controllers
require_relative "../app/controllers/application_controller"
require_relative "../app/controllers/home_page_controller"
require_relative "../app/controllers/search_fields_controller"
require_relative "../app/controllers/search_value_controller"
require_relative "../app/controllers/search_results_controller"
require_relative "../app/controllers/detailed_result_controller"
