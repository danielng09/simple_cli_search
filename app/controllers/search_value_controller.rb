class SearchValueController < ApplicationController

  attr_accessor :resource_class, :search_field

  def initialize(resource_class:, search_field:)
    @resource_class = resource_class
    @search_field = search_field

  end

  def render_body
    header title: "Searching for '#{search_field}' field on #{resource_class.name.pluralize.downcase}", align: "center", bold: true
  end

  def render_options
    aligned " * Type the '#{search_field}' value you'd like to search for"
  end

  #
  # @param {UserInterface} user_interface
  # @param {String} option
  #
  def post_handle_option(user_interface, option)
    if resource_class.valid_search_input(search_field, option)
      controller = SearchResultsController.new(resource_class: resource_class,
                                               search_field: search_field,
                                               search_value: option)
      user_interface.next(controller)

    else
      handle_error(user_interface, option)
    end
  end
end
