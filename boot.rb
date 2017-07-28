require 'active_record'
require 'pry-byebug'

# Load database
db_config = YAML::load(File.read("db/config.yml"))
ActiveRecord::Base.establish_connection(db_config["development"])

# Require all the models
require_relative "app/models/organization"
require_relative "app/models/user"
require_relative "app/models/ticket"
require_relative "app/models/user_interface"

# Require all the controllers
require_relative "app/controllers/application_controller"
require_relative "app/controllers/home_page_controller"
require_relative "app/controllers/resource_search_controller"

user_interface = UserInterface.new
home_page_controller = HomePageController.new
user_interface.next(home_page_controller)
