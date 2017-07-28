class HomePageController < ApplicationController

  OPTION_TO_RESOURCE = {
    '1' => Organization,
    "2" => User,
    "3" => Ticket
  }.freeze

  def render_body
    header title: "Welcome to Zendesk Search", align: "center", bold: true

    vertical_spacing 1
    aligned "Select search options:"
    aligned " * Type '1' to search for organizations"
    aligned " * Type '2' to search for users"
    aligned " * Type '3' to search for tickets"
    aligned " * Type 'quit' to exit"
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def post_handle_option(user_interface, option)
    resource = OPTION_TO_RESOURCE[option]

    if resource.present?
      controller = SearchFieldsController.new(resource)
      user_interface.next(controller)
    else
      handle_error(user_interface, option)
    end
  end

end
