require 'command_line_reporter'

class ApplicationController
  include CommandLineReporter

  def render
    system('clear')
    horizontal_rule(char: "*")
    vertical_spacing 1

    render_body
    vertical_spacing 1

    render_options_header
    render_options
    render_default_options
    vertical_spacing 1
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def handle_option(user_interface, option)
    case option
    when "quit"
      return
    when "restart"
      home_page_controller = HomePageController.new
      user_interface.next(home_page_controller)
    else
      post_handle_option(user_interface, option)
    end

  rescue => exception
    vertical_spacing 1
    aligned "Error Message:", color: "red"
    puts exception.message
    vertical_spacing 1

    handle_invalid_option(user_interface)
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
  #
  def handle_invalid_option(user_interface)
    vertical_spacing 1
    aligned("Sorry, you did not enter a valid option", color: "red")
    aligned("Please try again", color: "red")
    vertical_spacing 1

    new_option = STDIN.gets.chomp
    self.handle_option(user_interface, new_option)
  end

  protected

  def render_body
    nil
  end

  def render_options_header
    aligned "Select one of the following options:"
    vertical_spacing 1
  end

  def render_options
    nil
  end

  def render_default_options
    aligned " * Type 'quit' to exit"
    aligned " * Type 'restart' to start over" unless self.is_a?(HomePageController)
  end
end
