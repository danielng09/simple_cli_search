require 'active_record'

require_relative "utilities/file_loader"

# Load database
db_config = YAML::load(File.read("db/config.yml"))
ActiveRecord::Base.establish_connection(db_config["development"])

# Initialize user interface
user_interface = UserInterface.new
home_page_controller = HomePageController.new
user_interface.next(home_page_controller)
