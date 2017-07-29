require_relative "utilities/file_loader"

# Initialize user interface
user_interface = UserInterface.new
home_page_controller = HomePageController.new
user_interface.next(home_page_controller)
