require 'command_line_reporter'

class ApplicationController
  include CommandLineReporter

  def initialize

  end

  def render
    system('clear')
    horizontal_rule(char: "*")
    vertical_spacing 1

    render_body
  end

  def render_body
    nil
  end

  def handle_option(user_interface, option)
    return if option == "quit"
    post_handle_option(user_interface, option)
  end

  def post_handle_option(user_interface, option)
    nil
  end

  def handle_error(user_interface, option)
    puts "Sorry, you did not enter a valid option"
    puts "Please try again"
    new_option = gets.chomp
    self.handle_option(user_interface, new_option)
  end
end
