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

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def handle_option(user_interface, option)
    return if option == "quit"
    post_handle_option(user_interface, option)
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def post_handle_option(user_interface, option)
    nil
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def handle_error(user_interface, option)
    puts "Sorry, you did not enter a valid option"
    puts "Please try again"
    vertical_spacing 1

    new_option = gets.chomp
    self.handle_option(user_interface, new_option)
  end
end
